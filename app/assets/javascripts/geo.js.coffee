@Geo = class Geo
  constructor: (lat, lng) ->
    @geocoder = new google.maps.Geocoder();
    @latlng = new google.maps.LatLng(lat, lng);

  get_reverse_geocoding: (input, override, method) ->
    @geocoder.geocode('latLng': @latlng, (results, status) ->
      if ((results[0]?.formatted_address? and $(input).val() == '') or override)
        valid_types = ["neighborhood", "political", "locality", "administrative_area_level_2", "administrative_area_level_1", "country"]

        results = jQuery.grep(results, (result) ->
            for i in [0..valid_types.length]
              valid_type = true if jQuery.inArray(valid_types[i], result.types) != -1
            valid_type
        );

        unless method?
            $(input).attr('value', results[0].formatted_address);
        else
            method(input,results[0].formatted_address);
    );