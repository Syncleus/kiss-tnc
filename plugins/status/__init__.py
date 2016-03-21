import aprs.util
import time

plugin = None

def start(port_map, packet_cache):
    global plugin
    plugin = BeaconPlugin(port_map, packet_cache)
    plugin.run()

class BeaconPlugin( object ):

    def __init__(self, port_map, packet_cache):
        self.port_map = port_map
        self.packet_cache = packet_cache

    def run(self):
        while 1 :
            for port_name in self.port_map.keys():
                port = self.port_map[port_name]

                status_frame = {'source':port['identifier'], 'destination': 'APRS', 'path':port['status_path'].split(','), 'text': list(port['status_text'].encode('ascii'))}
                frame_hash = aprs.util.hash_frame(status_frame)
                if not frame_hash in self.packet_cache.values():
                    self.packet_cache[str(frame_hash)] = frame_hash
                    port['tnc'].write(status_frame, port['tnc_port'])
                    print(port_name + " >> " + aprs.util.format_aprs_frame(status_frame))
            time.sleep(600)