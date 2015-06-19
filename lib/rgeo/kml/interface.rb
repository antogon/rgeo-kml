# -----------------------------------------------------------------------------
#
# Kml toplevel interface
#
# -----------------------------------------------------------------------------

module RGeo

  module Kml

    class << self


      # High-level convenience routine for encoding an object as Kml.
      # Pass the object, which may one of the geometry objects specified
      # in RGeo::Feature, or an appropriate Kml wrapper entity such
      # as RGeo::Kml::Feature or RGeo::Kml::FeatureCollection.
      #
      # The only option supported is <tt>:entity_factory</tt>, which lets
      # you override the types of Kml entities supported. See
      # RGeo::Kml::EntityFactory for more information. By default,
      # encode supports objects of type RGeo::Kml::Feature and
      # RGeo::Kml::FeatureCollection.

      def encode(object_, opts_={})
        Coder.new(opts_).encode(object_)
      end


      # High-level convenience routine for decoding an object from Kml.
      # The input may be a JSON hash, a String, or an IO object from which
      # to read the JSON string.
      #
      # Options include:
      #
      # [<tt>:geo_factory</tt>]
      #   Specifies the geo factory to use to create geometry objects.
      #   Defaults to the preferred cartesian factory.
      # [<tt>:entity_factory</tt>]
      #   Specifies an entity factory, which lets you override the types
      #   of Kml entities that are created. It defaults to the default
      #   RGeo::Kml::EntityFactory, which generates objects of type
      #   RGeo::Kml::Feature or RGeo::Kml::FeatureCollection.
      #   See RGeo::Kml::EntityFactory for more information.
      # [<tt>:json_parser</tt>]
      #   Specifies a JSON parser to use when decoding a String or IO
      #   object. The value may be a Proc object taking the string as the
      #   sole argument and returning the JSON hash, or it may be one of
      #   the special values <tt>:json</tt>, <tt>:yajl</tt>, or
      #   <tt>:active_support</tt>. Setting one of those special values
      #   will require the corresponding library to be available. Note
      #   that the <tt>:json</tt> library is present in the standard
      #   library in Ruby 1.9, but requires the "json" gem in Ruby 1.8.
      #   If a parser is not specified, then the decode method will not
      #   accept a String or IO object; it will require a Hash.

      def decode(input_, opts_={})
        Coder.new(opts_).decode(input_)
      end


      # Creates and returns a coder object of type RGeo::Kml::Coder
      # that encapsulates encoding and decoding settings (principally the
      # RGeo::Feature::Factory and the RGeo::Kml::EntityFactory to be
      # used).
      #
      # The geo factory is a required argument. Other options include:
      #
      # [<tt>:geo_factory</tt>]
      #   Specifies the geo factory to use to create geometry objects.
      #   Defaults to the preferred cartesian factory.
      # [<tt>:entity_factory</tt>]
      #   Specifies an entity factory, which lets you override the types
      #   of Kml entities that are created. It defaults to the default
      #   RGeo::Kml::EntityFactory, which generates objects of type
      #   RGeo::Kml::Feature or RGeo::Kml::FeatureCollection.
      #   See RGeo::Kml::EntityFactory for more information.
      # [<tt>:json_parser</tt>]
      #   Specifies a JSON parser to use when decoding a String or IO
      #   object. The value may be a Proc object taking the string as the
      #   sole argument and returning the JSON hash, or it may be one of
      #   the special values <tt>:json</tt>, <tt>:yajl</tt>, or
      #   <tt>:active_support</tt>. Setting one of those special values
      #   will require the corresponding library to be available. Note
      #   that the <tt>:json</tt> library is present in the standard
      #   library in Ruby 1.9, but requires the "json" gem in Ruby 1.8.
      #   If a parser is not specified, then the decode method will not
      #   accept a String or IO object; it will require a Hash.

      def coder(opts_={})
        Coder.new(opts_)
      end


    end

  end

end
