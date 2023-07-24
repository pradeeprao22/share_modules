describe "user visit the module page", :type => :feature do
    
    before :each do
      @user = FactoryBot.create(:user)
      @tag = Tag.create(name: "HTML")
      @post = FactoryBot.build(:post)
      @post.user = @user
      @post.tags_id = [@tag.id]
      @post.save
    end
  
    it "finds the module details text on the page" do
        login_as @user
        visit post_path(@post.slug)
        expect(page).to have_content('Module Details')
    end

end