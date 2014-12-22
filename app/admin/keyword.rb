ActiveAdmin.register Keyword do
  actions :all, :except => [:edit]
  before_filter :skip_sidebar!, :only => :index
  # controller do
  #   nested_belongs_to :admin_user
  #   def index
  #     @keywords = Keyword.find_by_admin_user_id(current_admin_user.id)
  #   end
  #   def index
  #@keywords = Keyword.find_by_admin_user_id(current_admin_user.id)
  #     respond_to do |format|
  #       format.html { render "active_admin/resource/index"}
  #       format.xml  { render xml: @keywords}
  #       format.json { render json: @keywords}
  #     end
  #   end
  #  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #   member_action :index, :method => :get do
  #     @keywords = Keyword.find_by_admin_user_id(current_admin_user.id)
  #   end
  # end
  controller do
    # nested_belongs_to :admin_user
    # def index
    #   @keywords = Keyword.find_by_admin_user_id(current_admin_user.id)
    #   index! do |format|
    #     format.html{ render layout: 'active_admin' }
    #   end
    # end
    def member
      @keyword = Keyword.where(:id => params[:id], :admin_user_id => current_admin_user.id).first!
    end
    def create
      if !Keyword.where(:query =>params[:query], :admin_user_id => current_admin_user).first.nil?
        @keyword = Keyword.new(params[:keyword])
        @keyword.admin_user = current_admin_user
        @keyword.status = true
        @keyword.save
        redirect_to admin_keywords_path, :notice => "Keyword is added!"
      else
        redirect_to new_admin_keyword_path, :alert => "Keyword has been existed!"
      end
    end
  end
  member_action :toggle, :method => :put do
    keyword = Keyword.find(params[:id])
    keyword.update_attribute(:status, keyword.status ^ true)
    if keyword.save
    redirect_to admin_keywords_path, :notice => "Updated!"
    else
      redirect_to admin_keywords_path, :alert => "Error!"
      end
  end
  collection_action :index, :method => :get do

    @collection = current_admin_user.keywords.page() if params[:q].blank?
    @search = current_admin_user.keywords.search(clean_search_params(params[:q]))

    respond_to do |format|
      format.html { render "active_admin/resource/index" }
      format.xml { render xml: @collection }
      format.json { render json: @collection }
      format.csv { render xml: @collection }
    end
  end

  form do |f|
    f.inputs "Input New Keyword" do
      f.input :query, :as  => :string
    end
    f.actions
  end
  permit_params :id, :query, :admin_user, :status
  # def require_permission
  #   if :current_user != Keyword.find(params[:id]).admin_user
  #     redirect_to root_path
  #
  #     #Or do something else here
  #   end
  # end

  # require_permission
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  # controller do
  #   def resource
  #     Keyword.where(:admin_user_id => current_admin_user.id)
  #   end
  #
  # def index
  #     @keywords = Keyword.where(:admin_user_id => current_admin_user.id)
  #    end
  # end
  #    index do
  #      @keywords = Keyword.find_by_admin_user_id(current_admin_user.id)
  #      keywords.each do
  #      column :id
  #      column :query
  #      column :status
  #      column :admin_user
  #      actions
  #      end
  #    end
  index do
    # selectable_column
    # column :query
    # column :status
    # actions default: false do |keyword|
    #   a link_to "View Rank", admin_keyword_path(keyword) if !keyword.results.last.nil?
    # end
    render 'keyword_table'
  end

  show do
    h3 "Keyword:"+keyword.query
    if keyword.results.last.nil?
      redirect_to admin_keyword_path(keyword), :alert => "No Result to show!"
    else
      @result = keyword.results.last
      table_for Content.where(:result_id => @result.id) do |content|
        selectable_column
        column :rank
        column :url
        column :title
        column :description
        column :contents do |content|
          if !content.nil?
          link_to(fa_icon("line-chart").html_safe,
              admin_keyword_content_path(keyword,content),
              :class => "btn btn-small btn-info ")
          end

      end
    end


  end

  # sidebar "Results ", only: [:show, :edit] do
  #   ul do
  #     li link_to "Result", admin_keyword_results_path(keyword)
  #   end
  # end
  # index as: :block do |keyword|
  #   div for: keyword do
  #     h2 auto_link(keyword.query)
  #   end
  # end
  # def show
  #   @keyword = Keyword.find_by(current_admin_user.id)
  # end
  #index :as => :block do |keyword|
  # div :class => "abc", :for => keyword do
  #   h2 auto_link(keyword.query)
  #   span keyword.id
  #   end
  # end
  end
  end
