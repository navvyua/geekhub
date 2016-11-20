module ApplicationHelper
  def get_string_from_gender(gender)
    return_gender = if gender
                      'Female'
                    else
                      'Male'
                    end
  end
end
