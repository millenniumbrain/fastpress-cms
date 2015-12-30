Fastpress.route('dashboard') do |r|
  r.is do
    r.get do
      view 'dashboard/home', :layout => 'dashboard/layout'
    end
  end
  r.multi_route('dashboard')
end
