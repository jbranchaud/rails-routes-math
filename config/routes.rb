Rails.application.routes.draw do

  root to: 'application#index'

  # reusable regex
  number = /[-]?\d+/
  number_with_anchors = /\A[-]?\d+\z/

  get '/:op1/plus/:op2',
    constraints: { :op1 => number, :op2 => number },
    to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i + params(env)[:op2].to_i}"]] }
  get '/:op1/plus/:op2' => 'application#bad_request'

  get '/:op1/minus/:op2',
    constraints: { :op1 => number, :op2 => number },
    to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i - params(env)[:op2].to_i}"]] }
  get '/:op1/minus/:op2' => 'application#bad_request'

  get '/:op1/times/:op2',
    constraints: { :op1 => number, :op2 => number },
    to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i * params(env)[:op2].to_i}"]] }
  get '/:op1/times/:op2' => 'application#bad_request'

  get '/:op1/by/:op2',
    constraints: proc { |req| number_with_anchors === req.params[:op1] && number_with_anchors === req.params[:op2] && req.params[:op2].to_i != 0 },
    to: proc { |env| [200, {}, ["#{params(env)[:op1].to_i / params(env)[:op2].to_i}"]] }
  get '/:op1/by/:op2' => 'application#bad_request'

  match '*path', to: 'application#index', via: :GET

end

private

  def params(env)
    env['action_dispatch.request.path_parameters']
  end
