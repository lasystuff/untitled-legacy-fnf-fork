package funkin.scripting;

import rulescript.RuleScript;
import flixel.util.FlxDestroyUtil;

class HScript extends RuleScript implements IFlxDestroyable
{
	override public function new(path:String)
	{
		super(new rulescript.interps.NeoInterp());

		// default variables
		variables.set("Reflect", Reflect);
		variables.set("Type", Type);
		variables.set("Std", Std);

		execute(sys.io.File.getContent(path));
	}

	public function destroy()
	{
		callFunc("destroy");
	}

	public function callFunc(func:String, args:Array<Dynamic> = null):Dynamic
	{
		if (!variables.exists(func))
			return null;

		if (Reflect.isFunction(variables.get(func)))
			return Reflect.callMethod(null, variables.get(func), args);
		return null;
	}
}