Rails.application.routes.draw do

  # reusable regex
  number = /[-]?\d+/
  number_with_anchors = /\A[-]?\d+\z/

  get '/:op1/plus/:op2' => 'application#add', constraints: { :op1 => number, :op2 => number }
  get '/:op1/plus/:op2' => 'application#bad_request'

  get '/:op1/minus/:op2' => 'application#subtract', constraints: { :op1 => number, :op2 => number }
  get '/:op1/minus/:op2' => 'application#bad_request'

  get '/:op1/times/:op2' => 'application#multiply', constraints: { :op1 => number, :op2 => number }
  get '/:op1/times/:op2' => 'application#bad_request'

  get '/:op1/by/:op2' => 'application#divide', constraints: proc { |req| number_with_anchors === req.params[:op1] && number_with_anchors === req.params[:op2] && req.params[:op2].to_i != 0 }
  get '/:op1/by/:op2' => 'application#bad_request'

end
