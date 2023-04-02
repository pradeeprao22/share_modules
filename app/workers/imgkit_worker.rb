class ImgkitWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(slug, post_id) 
    if Rails.env == "development"
        kit = IMGKit.new('http://localhost:3001/posts/build_module/'+ slug)
        img = kit.to_img(:png)
          
        if ImageRepo.find_by(post_id: post_id) == nil
          image_file = kit.to_file('app/assets/images/module_screenshots/'+ slug+'.png')
          ImageRepo.create(image_name: slug, post_id: post_id)
        end
  
    elsif Rails.env == "production"
        kit = IMGKit.new("http://ai.londevs.com/posts/build_module/"+ slug)
        img = kit.to_img(:png)
  
        if ImageRepo.find_by(post_id: post_id) == nil
          image_file = kit.to_file('app/assets/images/module_screenshots/'+ slug+'.png')
          ImageRepo.create(image_name: slug, post_id: post_id)
        end
  
    else 
        flash[:notice] = "Some error happened"
    end
  end
end