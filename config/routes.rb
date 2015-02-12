Rails.application.routes.draw do

  root to: 'application#index'

  # reusable regex
  operand = /(plus)|(minus)|(times)|(by)/
  number = /[-]?\d+/
  not_zero = /[-]?[1-9]+[\.\d+]?/

  constraints op1: number do
    constraints operand: operand do
      constraints op2: number do
        get '/:op1/plus/:op2',
          to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i + params(env)[:op2].to_i}"]] }
        get '/:op1/minus/:op2',
          to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i - params(env)[:op2].to_i}"]] }
        get '/:op1/times/:op2',
          to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i * params(env)[:op2].to_i}"]] }
        get '/:op1/by/:op2',
          constraints: { :op2 => not_zero },
          to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i / params(env)[:op2].to_i}"]] }
      end
    end
  end

  get '/:op1/:operand/:op2' => 'application#bad_request'

  match '*path', to: 'application#index', via: :GET

end

private

  def params(env)
    env['action_dispatch.request.path_parameters']
  end
