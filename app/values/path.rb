class Path < Struct.new( :value )
  FORMAT = /\A\/[\w\.-\/]*/i
end
