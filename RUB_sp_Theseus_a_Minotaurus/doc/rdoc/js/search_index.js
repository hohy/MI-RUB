var search_data = {"index":{"searchIndex":["tam","being","cave","map","minotaurus","options","runner","theseus","tunnel","<=>()","==()","==()","accept()","accept()","add_cave()","add_tunnel()","add_tunnel()","find_next_tunnel()","find_next_tunnel()","generate()","init_output()","light_candle()","load_map_from_file()","make_step()","mark()","mark()","marked?()","marked?()","new()","new()","new()","new()","new()","new()","new()","new()","run()","to_s()","to_s()","visit_cave()","visit_cave()","visit_tunnel()","visit_tunnel()","write_current_state()","write_output()","readme"],"longSearchIndex":["tam","tam::being","tam::cave","tam::map","tam::minotaurus","tam::options","tam::runner","tam::theseus","tam::tunnel","tam::tunnel#<=>()","tam::cave#==()","tam::tunnel#==()","tam::cave#accept()","tam::tunnel#accept()","tam::map#add_cave()","tam::cave#add_tunnel()","tam::map#add_tunnel()","tam::minotaurus#find_next_tunnel()","tam::theseus#find_next_tunnel()","tam::map#generate()","tam::runner#init_output()","tam::cave#light_candle()","tam::map#load_map_from_file()","tam::being#make_step()","tam::cave#mark()","tam::tunnel#mark()","tam::cave#marked?()","tam::tunnel#marked?()","tam::being::new()","tam::cave::new()","tam::map::new()","tam::minotaurus::new()","tam::options::new()","tam::runner::new()","tam::theseus::new()","tam::tunnel::new()","tam::runner#run()","tam::cave#to_s()","tam::tunnel#to_s()","tam::being#visit_cave()","tam::runner#visit_cave()","tam::being#visit_tunnel()","tam::runner#visit_tunnel()","tam::runner#write_current_state()","tam::runner#write_output()",""],"info":[["TaM","","TaM.html","",""],["TaM::Being","","TaM/Being.html","","<p>Superclass for beings (Theseus and Minotaurus) on map.\n"],["TaM::Cave","","TaM/Cave.html","","<p>Represents cave on map.\n"],["TaM::Map","","TaM/Map.html","","<p>Class represents map. Contains caves and tunnels between them.\n"],["TaM::Minotaurus","","TaM/Minotaurus.html","",""],["TaM::Options","","TaM/Options.html","",""],["TaM::Runner","","TaM/Runner.html","",""],["TaM::Theseus","","TaM/Theseus.html","",""],["TaM::Tunnel","","TaM/Tunnel.html","","<p>Class represents tunnels on map. Tunnel connects two caves.\n"],["<=>","TaM::Tunnel","TaM/Tunnel.html#method-i-3C-3D-3E","(another_tunnel)",""],["==","TaM::Cave","TaM/Cave.html#method-i-3D-3D","(object)",""],["==","TaM::Tunnel","TaM/Tunnel.html#method-i-3D-3D","(object)",""],["accept","TaM::Cave","TaM/Cave.html#method-i-accept","(being)","<p>Method used in visitor pattern\n"],["accept","TaM::Tunnel","TaM/Tunnel.html#method-i-accept","(being)","<p>Method used in visitor pattern.\n"],["add_cave","TaM::Map","TaM/Map.html#method-i-add_cave","(new_cave)","<p>adds new cave to map\n"],["add_tunnel","TaM::Cave","TaM/Cave.html#method-i-add_tunnel","(tunnel)","<p>Add tunnel to cave\n"],["add_tunnel","TaM::Map","TaM/Map.html#method-i-add_tunnel","(tunnel)","<p>adds new tunnel to map\n"],["find_next_tunnel","TaM::Minotaurus","TaM/Minotaurus.html#method-i-find_next_tunnel","()","<p>Finds tunnel where Minotaurus will go.\n"],["find_next_tunnel","TaM::Theseus","TaM/Theseus.html#method-i-find_next_tunnel","()",""],["generate","TaM::Map","TaM/Map.html#method-i-generate","(caves_num, tunnels_num)","<p>Generate random map with <code>caves_num</code> number of caves\ninterconnected by <code>tunnels_num</code> of tunnels.\n"],["init_output","TaM::Runner","TaM/Runner.html#method-i-init_output","()",""],["light_candle","TaM::Cave","TaM/Cave.html#method-i-light_candle","()","<p>Light candle in cave\n"],["load_map_from_file","TaM::Map","TaM/Map.html#method-i-load_map_from_file","(src_file)","<p>Load map from file. Format of the file: Every line represents one tunnel\nbetween two caves. <code>CaveA CaveB</code> …\n"],["make_step","TaM::Being","TaM/Being.html#method-i-make_step","()","<p>use visitor pattern to figure out if being is in tunnel or in cave\n"],["mark","TaM::Cave","TaM/Cave.html#method-i-mark","(mark)","<p>Add mark to cave\n"],["mark","TaM::Tunnel","TaM/Tunnel.html#method-i-mark","(being)","<p>Add mark to tunnel. Used by beings for orientation in map.\n"],["marked?","TaM::Cave","TaM/Cave.html#method-i-marked-3F","(mark)","<p>Has cave given mark?\n"],["marked?","TaM::Tunnel","TaM/Tunnel.html#method-i-marked-3F","(mark)","<p>Check if tunnel has some mark. Used by beings for orientation in map.\n"],["new","TaM::Being","TaM/Being.html#method-c-new","()",""],["new","TaM::Cave","TaM/Cave.html#method-c-new","(id)",""],["new","TaM::Map","TaM/Map.html#method-c-new","()",""],["new","TaM::Minotaurus","TaM/Minotaurus.html#method-c-new","()",""],["new","TaM::Options","TaM/Options.html#method-c-new","(argv)",""],["new","TaM::Runner","TaM/Runner.html#method-c-new","(argv)",""],["new","TaM::Theseus","TaM/Theseus.html#method-c-new","()",""],["new","TaM::Tunnel","TaM/Tunnel.html#method-c-new","(id, cave_a, cave_b)",""],["run","TaM::Runner","TaM/Runner.html#method-i-run","()",""],["to_s","TaM::Cave","TaM/Cave.html#method-i-to_s","()",""],["to_s","TaM::Tunnel","TaM/Tunnel.html#method-i-to_s","()",""],["visit_cave","TaM::Being","TaM/Being.html#method-i-visit_cave","(cave)","<p>make step in cave\n"],["visit_cave","TaM::Runner","TaM/Runner.html#method-i-visit_cave","(cave)","<p>Potkají-li se na chodbě, je zabit Theseus.\n"],["visit_tunnel","TaM::Being","TaM/Being.html#method-i-visit_tunnel","(tunnel)","<p>make step in tunnel\n"],["visit_tunnel","TaM::Runner","TaM/Runner.html#method-i-visit_tunnel","(tunnel)","<p>Pokud potká Minotaura v jeskyni, zabije ho.\n"],["write_current_state","TaM::Runner","TaM/Runner.html#method-i-write_current_state","(out_file)",""],["write_output","TaM::Runner","TaM/Runner.html#method-i-write_output","(result)",""],["README","","README_rdoc.html","","<p>Theseus a Minotaurus\n<p>Zadání\n<p>Jistě znáte báji o stvůře s býčí hlavou – Minotaurovi, který zajal krásnou\n…\n"]]}}