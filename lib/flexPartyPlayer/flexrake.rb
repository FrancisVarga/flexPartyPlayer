require 'airake'
module Airake
  
  module Projects
        
    # Project for Flex application
    class Flex < Airake::Project
      
      attr_reader :mxml_path, :appxml_path
      attr_reader :assets, :certificate          
      
      # Load options
      #
      # +options+: If nil, options are loaded from airake.yml in root. (All paths relative to base directory)      
      # - +mxml_path+: Path to the ProjectName.mxml
      # - +appxml_path+: Path to application descriptor    
      # - +assets+: Path to assets
      # - +certificate+: Path to certificate      
      #
      #            
      def load(options = {})
        super(options)
        
        @mxml_path = File.join(base_dir, options[:mxml_path])      
        
        with_keyed_options([ :assets, :mxmlc_path, :adt_path, :asdoc_path, 
          :mxmlc_extra_opts, :asdoc_extra_opts ], options)

        ensure_exists([ @mxml_path ])
      end      
      
      # Flex compiler command (under AIR) for this project
      def fmxmlc
        mxmlc({ :config_name => "flex" })
      end
      
      # Flex compiler command for this project
      def mxmlc(options = {})
        options = options.merge({ :swf_path => @swf_path, :target_file => @mxml_path, :lib_dir => @lib_dir, 
          :src_dirs => @src_dirs, :debug => @debug, :mxmlc_extra_opts => @mxmlc_extra_opts, :incremental => true,
          :mxmlc_path => @mxmlc_path })

        Airake::Commands::Mxmlc.new(options)
      end
      
      def clean
        paths = [ @swf_path ]
        paths.each do |path|
          FileUtils.rm(path, :verbose => true) if File.exist?(path)
        end
      end
    end
    
  end
  
end
