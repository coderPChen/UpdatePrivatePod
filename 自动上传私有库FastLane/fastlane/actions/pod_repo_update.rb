module Fastlane
  module Actions
    module SharedValues
      POD_REPO_UPDATE_CUSTOM_VALUE = :POD_REPO_UPDATE_CUSTOM_VALUE
    end

    class PodRepoUpdateAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        command = []

        command << "pod repo update"
        
        if params[:name]
          command << params[:name]
        end
    
        command << "--silent"  if params[:silent]
        command << "--verbose" if params[:verbose]
        command << "--no-ansi" if params[:no_ansi]
        command << "--help"    if params[:quick]

        result = Actions.sh(command.join(' '))
        UI.success("pod repo update Successfully ⬆️ ")
        return result

        # sh "shellcommand ./path"

        # Actions.lane_context[SharedValues::POD_REPO_UPDATE_CUSTOM_VALUE] = "my_val"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "pod repo update"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to update pod repo"
      end

      def self.available_options
        # Define all options your action supports. 
        
        # Below a few examples
        [
         
            FastlaneCore::ConfigItem.new(key: :name,
                                         description: "Updates PrivateRepoName",
                                         optional: false,
                                         is_string: true),

            FastlaneCore::ConfigItem.new(key: :silent,
                                         description: " Show nothing",
                                         is_string: false,
                                         default_value: false),

            FastlaneCore::ConfigItem.new(key: :verbose,
                                         description: "Show more debugging information",
                                         is_string: false,
                                         default_value: false),

            FastlaneCore::ConfigItem.new(key: :no_ansi,
                                         description: "Show output without ANSI codes",
                                         is_string: false,
                                         default_value: false),

            FastlaneCore::ConfigItem.new(key: :help,
                                         description: " Show help banner of specified command",
                                         is_string: false,
                                         default_value: false),

        ]
      end

      def self.output
      end

      def self.return_value
        nil
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["pchen"]
      end

      def self.is_supported?(platform)

        [:ios, :mac].include?(platform)

      end



    end
  end
end
