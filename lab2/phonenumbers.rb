require 'getoptlong'
require 'json'

$contacts = Hash.new(Array.new())


def newContact(nick, number)
    $contacts[nick] = [] unless $contacts[nick]
    $contacts[nick].push(number)
end

def getUser(nick)
    return unless $contacts.include? nick
    print nick.to_s + ": "
    for i in $contacts[nick]
        print i.to_s + " "
    end
    print "\n"
end

def getUsers()
    $contacts.each do |k, v|
        print k.to_s + ": "
        for i in v
            print i.to_s + ", "
        end
        print "\n"
    end
end

def readFromJSON(file)
    jFile = File.read(file)
    return if jFile.length === 0
    arr = JSON.parse(jFile)
    $contacts = arr['contacts']
end

def writeToJSON(file)
    arr = Hash.new
    arr["contacts"] = $contacts
    File.write("phonedb.json",JSON.pretty_generate(arr))
end

def mygetopt()
    opts = GetoptLong.new(
        ['-p',GetoptLong::REQUIRED_ARGUMENT],
        ['-n',GetoptLong::REQUIRED_ARGUMENT],  
        ['-g',GetoptLong::REQUIRED_ARGUMENT],  
        ['--wr',GetoptLong::NO_ARGUMENT]  
    )
    return opts
end

def phone_app()
    file = "phonedb.json"
    readFromJSON(file)
    opts = mygetopt()
    
    val = ""
    opts.each do |opt, arg1|
        case opt
            when '-n'
                newContact(arg1, val)
            when '-p'
                val = arg1
        end
    end
                
    
    getUser("Pawel")
    getUsers()    
    writeToJSON(file)
end

phone_app
