module JobsHelper

  def categories
    @categories = Category.where(parent_id: nil)
  end
end
