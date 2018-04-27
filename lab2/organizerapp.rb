require 'json'

$contacts = Hash.new(Array.new()) 
#CRUD form of app
#create
def newContact(nick, number)
    #some kind of problem with basic situation, we need unless statement
    $contacts[nick] = [] unless $contacts[nick]
    $contacts[nick].push(number)
    print "Contact " + nick.to_s + " is created.\n"
end
#delete
def delContact(nick)
    #check if this nick exists
    return unless $contacts.include? nick

    $contacts.delete(nick)
    print "Contact " + nick.to_s + " is deleted.\n" 
end
#update
def updateContact(nick, number)
    #check if this nick exists
    return unless $contacts.include? nick

    delContact(nick)
    newContact(nick, number)
    print "Contact " + nick.to_s + " is updated.\n"
end
#read
def getContact(nick)
    #check if this nick exists
    return unless $contacts.include? nick

    print nick.to_s + " tel:  "
    for nck in $contacts[nick]
        puts nck.to_s + " "
    end
   
end

#show all users
def getAllContacts()
    puts "List of contacts:"
    $contacts.each do |k, v|
        getContact(k)
    end
end
$groups = Hash.new(Array.new()) 
$contactGroups = Array.new
def setGroups()
    $contactGroups.push("friends")
    $contactGroups.push("family")
    $contactGroups.push("workers")
end


#app in CRUD way
#create
def newGroupMember(nick, group)
    return unless $contactGroups.include? group
    
    unless $groups[group] 
        $groups[group] = [nick] 
        return     
    end
    $groups[group] += [nick] unless $groups[group].include? nick
    puts "Contact " + nick.to_s + " is added to group: " + group.to_s
end

#delete
def delGroup(nick, group)
    #check if this nick exists
    return unless $contactGroups.include? group

    $contacts.delete(group)
    puts "Contact " + nick.to_s + " is deleted from " + group.to_s
end

#read
def getGroup(gname)
    return unless $groups.include? gname
    v = $groups[gname]
    print gname.to_s + " - "
    for vls in v
        print vls.to_s + ", "
    end
    print "\n"
end

def getAllGroups()
    puts "Members of group:"    
    $groups.each do |k, v|
        getGroup(k);
    end
end

def jfread(filepath)
    jsonfile = File.read(filepath)
    return if jsonfile.length === 0

    hasharr = JSON.parse(jsonfile)
    $contacts = hasharr['contacts']
    $groups = hasharr['groups']
end

def jfwrite(filepath)
    hasharr = Hash.new

    hasharr["contacts"] = $contacts
    hasharr["groups"] = $groups

    File.write(filepath, JSON.pretty_generate(hasharr))
end

require 'getoptlong'
def app_args()
    opts = GetoptLong.new(
        ['--newc', GetoptLong::REQUIRED_ARGUMENT],
        ['--delc',GetoptLong::REQUIRED_ARGUMENT],
        ['--updc',GetoptLong::REQUIRED_ARGUMENT],
        ['--getc',GetoptLong::REQUIRED_ARGUMENT],
        ['--newg',GetoptLong::REQUIRED_ARGUMENT],
        ['--delg',GetoptLong::REQUIRED_ARGUMENT],
        ['--getg',GetoptLong::REQUIRED_ARGUMENT],
        ['--aval', GetoptLong::REQUIRED_ARGUMENT],
        ['--gnm', GetoptLong::REQUIRED_ARGUMENT],
        ['--getac', GetoptLong::NO_ARGUMENT],
        ['--getag', GetoptLong::NO_ARGUMENT]
    )
    return opts
end

def app_help()
    helparr  = ['--aval <phone number> --newc <contact name> [add new contact]',
                '--delc <contact name> [delete contact]',
                '--aval <phone number> --updc <contact name> [update contact]',
                '--getc <contact name> [read contact]',
                '--gnm <group name> --newg <contact name> [add contact to group]',
                '--gnm <group name> --delg <contact name> [delete contact from group]',
                '--getg <group name> [read group members]',
                '--getac [read all contacts]',
                '--getag [read all groups]']
    return helparr
end

def main()
    if ARGV.length == 0
        puts "You don't set up option or arguments. Possible option is:"
        puts app_help()
    end
    file = "phonedb.json";
    jfread(file);

    opts = app_args()
    argval = "-"

    opts.each do |opt, arg|
        case opt
            when '--newc'
                newContact(arg, argval)
            when '--delc'
                delContact(arg)
            when '--updc'
                updateContact(arg, argval)
            when '--getc'
                getContact(arg)
            when '--newg'
                newGroupMember(arg, argval)
           when '--delg'
                delGroup(arg, argval)
            when '--getg'
                getGroup(arg)
            when '--aval'
                argval = arg
            when '--gnm'
                argval = arg
            when '--getac'
                getAllContacts()    
            when '--getag'          
                getAllGroups()
                
        end
    end

    jfwrite(file)
end

main
