package flixel.input;
import flixel.system.macros.EnumBuildingMacro;
import flixel.system.macros.EnumBuildingMacro;
import flixel.system.macros.FlxMacroUtil;
@:enum
@:build(flixel.system.macros.EnumBuildingMacro.build())
abstract FlxInputAction(String) from String to String {


	public static var fromStringMap(default, null):Map<String, FlxInputAction>
	= FlxMacroUtil.buildMap("flixel.input.FlxInputAction");

	public static var toStringMap(default, null):Map<FlxInputAction, String>
	= FlxMacroUtil.buildMap("flixel.input.FlxInputAction", true);


	var LEFT = "left";
	var RIGHT = "right";
	var JUMP = "jump";
	var SHOOT = "shoot";
	var FLY = "fly";
	var DUCK = "duck";
	var CRAWL = "crawl";
	var NONE = "none" ;


	@:from
	public static inline function fromString(s:String)
	{
		s = s.toUpperCase();
		return fromStringMap.exists(s) ? fromStringMap.get(s) : NONE;
	}

	@:to
	public inline function toString():String
	{
		return toStringMap.get(this);
	}
}
