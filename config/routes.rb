Rails.application.routes.draw do

  get 'communications' => 'web#communications'
  get 'cv' => 'web#cv'
  get  'contactme' => 'web#contactme'
  post 'contactme' => 'web#send_contact'
  root 'web#index'

end
