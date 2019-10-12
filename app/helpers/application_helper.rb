module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def profile_badge_helper(char)
    if ("A".."F").include?(char)
      "bg-primary"
    elsif ("G".."M").include?(char)
      "bg-success"
    elsif ("N".."U").include?(char)
      "bg-info"
    elsif ("V".."Z").include?(char)
      "bg-secondary"
    else
      "bg-light"
    end
  end
end
