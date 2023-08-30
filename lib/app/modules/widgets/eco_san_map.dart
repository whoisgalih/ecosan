import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart' hide TileLayer;

class EcoSanMap extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double markerSize;
  final double? zoom;

  const EcoSanMap({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.markerSize,
    this.zoom,
  });

  @override
  State<EcoSanMap> createState() => _EcoSanMapState();
}

class _EcoSanMapState extends State<EcoSanMap> {
  final MapController _controller = MapController();
  Style? _style;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _initStyle();
  }

  void _initStyle() async {
    try {
      _style = await _readStyle();
    } catch (e, stack) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(stack);
      _error = e;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (_error != null) {
      children.add(Expanded(child: Text(_error!.toString())));
    } else if (_style == null) {
      children.add(const Center(child: CircularProgressIndicator()));
    } else {
      children.add(Flexible(child: _map(_style!)));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children);
  }

  Future<Style> _readStyle() => StyleReader(
          uri: 'mapbox://styles/mapbox/streets-v12?access_token={key}',
          // ignore: undefined_identifier
          apiKey: dotenv.env['MAPBOX_ACCESS_TOKEN']!,
          logger: const Logger.console())
      .read();

  Widget _map(Style style) => FlutterMap(
        mapController: _controller,
        options: MapOptions(
            center: LatLng(widget.latitude, widget.longitude),
            zoom: widget.zoom ?? 13,
            interactiveFlags: InteractiveFlag.drag |
                InteractiveFlag.flingAnimation |
                InteractiveFlag.pinchMove |
                InteractiveFlag.pinchZoom |
                InteractiveFlag.doubleTapZoom),
        children: [
          VectorTileLayer(
            tileProviders: style.providers,
            theme: style.theme,
            sprites: style.sprites,
            maximumZoom: 22,
            tileOffset: TileOffset.mapbox,
            layerMode: VectorTileLayerMode.raster,
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(widget.latitude, widget.longitude),
                width: widget.markerSize,
                height: widget.markerSize,
                builder: (context) => Transform.translate(
                  offset: Offset(0, -widget.markerSize / 2),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: widget.markerSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
