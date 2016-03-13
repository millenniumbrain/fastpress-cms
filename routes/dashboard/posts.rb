Fastpress.route('posts', 'dashboard') do |r|
  r.is 'new' do
    r.get do
      view 'dashboard/posts/new', :layout => 'dashboard/layout'
    end
  end

  r.is do
    r.get do

    end

    r.post do

    end
  end
end
