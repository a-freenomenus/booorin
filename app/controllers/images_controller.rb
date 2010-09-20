class ImagesController < ApplicationController  
  layout "main"
  # GET /images
  # GET /images.xml
  def index    
    @images = Image.all(:order => "created_at DESC")
    @image = Image.new
    
    respond_to do |format|
      format.html # index.html.erb
      # format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @image = Image.find(params[:id])
    # TODO: Add logging of views count
    respond_to do |format|
      format.html # show.html.erb
      # format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @image = Image.new

    # respond_to do |format|
      # format.html # new.html.erb
      # format.xml  { render :xml => @image }
    # end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    @user = current_user
    @image = @user.images.create(params[:image])
    @image.user_id = current_user.id if logged_in?
    
    respond_to do |format|
      if @image.save      
        # flash[:notice] = "Image was successfully created."
        format.html { redirect_to(@image) }
        # format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        format.html { redirect_to(root_path) }
        # format.html { render :action => "new" }
        # format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  # def update
  #   @image = Image.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @image.update_attributes(params[:image])
  #       format.html { redirect_to(@image, :notice => 'Image was successfully updated.') }
  #       # format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       # format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(images_url) }
      # format.xml  { head :ok }
    end
  end
  
  def rating_up
    @image = Image.find(params[:id])
    # render_text "+"
    # puts 1;
    # redirect_to images_path
    # print @image    
    render :partial => "rating_up"
  end
  
  def rating_down
    # @image = Image.find(params[:id])
    # render_text "-"
    render :partial => "rating_down"
  end
end
