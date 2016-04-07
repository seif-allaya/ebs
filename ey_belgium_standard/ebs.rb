require 'roo'
require 'colorize'
require 'optparse'

def main
  options = {}
  optparse = OptionParser.new do |opts|
    opts.banner = "Usage: ruby ebs.rb [options]"
     opts.on('-c', '--client', 'Input the client name') { |file| options[:client] = file }
     opts.on('-P', '--pentest', 'Input the pentest name') { |dir| options[:pentest] = dir }
     opts.on('-v', '--verbose', 'Run verbosely') { |v| options[:verbose] = v }
   end
   begin
     optparse.parse!
     if options[:client].nil?
       raise OptionParser::MissingArgument
     end
     if options[:pentest].nil?
       raise OptionParser::MissingArgument
     end
   rescue OptionParser::ParseError => e
     puts "[OH] Noting to do!!".colorize(:red)
     puts optparse
     exit
   end
   #Setting Up the variables
  subdirs = ["Traffic_Dumps", "Evidences", "Working_Documents", "Output_of_Tools" ]
   output_of_tools =[ "Burp", "Nmap", "Nikto", "Crawler", "SSLAudit", "Dump"]
   directory_name = "#{options[:client].capitalize}-#{options[:pentest].capitalize}-#{Time.now.strftime("%Y")}"
   evidences = ["Screenshots", "raws" ,"leaks"]
   `mkdir #{directory_name}`
   puts "Creating :".green << "  #{directory_name}"
   # Looping on sub directories
   subdirs.each { |subdir|
     puts "Creating :".green << "  #{directory_name}/#{subdir}"
      `mkdir #{directory_name}/#{subdir}`
    }
    # Looping on Output_of_Tools sub directories
    working_dir = "#{directory_name}/Output_of_Tools"
    output_of_tools.each { |subdir|
      puts "Creating :".green << "  #{working_dir}/#{subdir}"
       `mkdir #{working_dir}/#{subdir}`
     }
     # Looping on Evidences sub directories
     working_dir = "#{directory_name}/Evidences"
     evidences.each { |subdir|
       puts "Creating :".green << "  #{working_dir}/#{subdir}"
        `mkdir #{working_dir}/#{subdir}`
      }

      loops = ["#{directory_name}/Output_of_Tools/Nmap/#{directory_name}_burp.state",
      "#{directory_name}/Output_of_Tools/Nmap/#{directory_name}_Dump.pcap",
      "#{directory_name}/Output_of_Tools/Nmap/#{directory_name}_Nmap",
      "#{directory_name}/Output_of_Tools/Nmap/#{directory_name}_Nikto"]
      loops.each { |looper|
      puts "Creating :".green << "  #{looper}"
       `mkdir #{looper}`
     }

end

main()
