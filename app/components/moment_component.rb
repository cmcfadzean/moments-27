# frozen_string_literal: true

class MomentComponent < ViewComponent::Base
  def initialize(title:, date:, link:, description:)
    @title = title
    @date = date
    @link = link
    @description = description
  end

end
