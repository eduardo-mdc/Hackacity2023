The file 'detector_osm_ways.json' contains a mapping between:
1) A traffic detector placed in a street of Porto, AND
2) A way in OpenStreetMap

Let's use an example. Here's the first item in the file:

{
    "detector_name": "CMP_001-e1",
    "osm_way_id": "1174193044"
}

This means that detector "CMP_001-e1" is placed in a street corresponding to OSM way 1174193044. You can see OSM's data for that way here:
https://www.openstreetmap.org/way/1174193044

Most streets will have the following information on their corresponding OSM way:
- Type of road under tag "highway" (primary, secondary, etc)
- Number of lanes; if it's a two-way street, the number of lanes in each direction
- The maximum speed
- The street name
- The surface type (asphalt, for example)
- What each lane is for; for example, one lane might be to turn left while the other is to turn right. This is under tag "turn:lanes" for one-way streets, and under tags "turn:lanes:backward" and "turn:lanes:forward" for two-way streets. Note that many OSM ways don't have these tags because they are used only for ways that lead to an intersection.

In some cases, detectors will correspond to multiple OSM ways, like this example:

{
    "detector_name": "CMP_007-e4_lq",
    "osm_way_id": [
        "1174565658",
        "453761211"
    ]
}

In this case, the detector is measuring the traffic in the union of these two OSM ways. We use this format when OSM ways are small and we want to consider larger sections of streets.