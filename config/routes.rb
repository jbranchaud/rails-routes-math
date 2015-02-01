Rails.application.routes.draw do

  get '/:op1/plus/:op2' => 'application#add', constraints: { :op1 => /[-]?\d+/, :op2 => /[-]?\d+/ }
  get '/:op1/plus/:op2' => 'application#bad_request'

  get '/:op1/minus/:op2' => 'application#subtract', constraints: { :op1 => /[-]?\d+/, :op2 => /[-]?\d+/ }
  get '/:op1/minus/:op2' => 'application#bad_request'

  get '/:op1/times/:op2' => 'application#multiply', constraints: { :op1 => /[-]?\d+/, :op2 => /[-]?\d+/ }
  get '/:op1/times/:op2' => 'application#bad_request'

  get '/:op1/by/:op2' => 'application#divide', constraints: proc { |req| /\A[-]?\d+\z/ === req.params[:op1] && /\A[-]?\d+\z/ === req.params[:op2] && req.params[:op2].to_i != 0 }
  get '/:op1/by/:op2' => 'application#bad_request'

end
