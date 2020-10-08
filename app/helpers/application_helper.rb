module ApplicationHelper
    def flash_class(flash)
        case flash.to_sym
        when :notice then "notification is-info"
        when :success then "notification is-success"
        when :error then "notification is-danger"
        when :alert then "notification is-warning"
        end
    end
end
