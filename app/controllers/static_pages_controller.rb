class StaticPagesController < ApplicationController
  def index
    @display_options = ["Select&nbsp;&#8595;".html_safe, "List", "Map"]
    @bedroom_options = ['Select&nbsp;&#8595;'.html_safe] + (1..4).to_a << "4+"
    @bathroom_options = ['Select&nbsp;&#8595;'.html_safe] + (1..3).to_a << "3+"
  end

  def contact
  end

  def terms
  end

  def about
  end

  def privacy
  end
end
