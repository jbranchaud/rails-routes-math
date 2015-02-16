Rails.application.routes.draw do

  root to: redirect { |path_params, req| '/random' }

  # reusable regex
  operator = /(plus)|(minus)|(times)|(by)/
  number = /[-]?\d+/
  not_zero = /[-]?[1-9]+[\.\d+]?/

  constraints op1: number do
    constraints operator: operator do
      constraints op2: number do
        get '/:op1/plus/:op2',
          to: ->(env) { [200, {}, ["#{params(env)[:op1].to_i + params(env)[:op2].to_i}"]] }
        get '/:op1/minus/:op2',
          to: ->(env) { [200, {}, ["#{params(env)[:op1].to_i - params(env)[:op2].to_i}"]] }
        get '/:op1/times/:op2',
          to: ->(env) { [200, {}, ["#{params(env)[:op1].to_i * params(env)[:op2].to_i}"]] }
        get '/:op1/by/:op2',
          constraints: { :op2 => not_zero },
          to: ->(env) { [200, {}, ["#{params(env)[:op1].to_i / params(env)[:op2].to_i}"]] }
      end
    end
  end

  get '/:op1/:operator/:op2',
    to: ->(env) { [400, {}, ["400 Bad Request"]] }

  match '*path',
    to: redirect { |path_params, req| "/#{rand_int}/#{random_operator}/#{rand_int}" },
    via: :GET

end

private

  def params(env)
    env['action_dispatch.request.path_parameters']
  end

  def rand_int(value=100)
    (rand * value).to_i
  end

  def rand_operator
    %w[plus minus times by].sample
  end
