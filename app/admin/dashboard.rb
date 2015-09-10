ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "All Agencies" do
          ul do
            Agency.all.map do |agency|
              li link_to(agency.email, admin_agency_path(agency))
            end
          end
        end
      end
      column do
        panel "Recent Buses" do
          table_for Bus.all.limit(10).map do
            column("Registration Number") { |bus| link_to(bus.registration_number, admin_bus_path(bus))}
            column("Bus Type") { |bus| bus.bus_type}
          end
        end
      end
    end #columns
  end # content
end
