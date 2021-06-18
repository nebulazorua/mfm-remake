// I KNOW MFM CALLS THESE CROSSFADES
// I DONT CARE!!!!!!!!!!

package;

typedef AfterimageSection = {
	var sectionNotes:Array<Dynamic>;
	var crossFade:Bool;
	var altAnim:Null<Bool>;
	var mustHitSection:Null<Bool>;
	var bpm:Null<Int>;
}

typedef CrossFades = {
	var song:String;
	var notes:Array<AfterimageSection>;
}


class AfterImages {

  public static function parseJSONshit(rawJson:String):CrossFades
	{
		var json = Json.parse(rawJson);
		if(json.crossFade!=null){
			var swagShit:CrossFades = cast json.crossFade;
			return swagShit;
		}
		return null;

	}

  public static function loadFromJson(jsonInput:String, ?folder:String):Dynamic
  {
    var rawJson = Assets.getText(Paths.json(folder.toLowerCase() + '/' + jsonInput.toLowerCase())).trim();

    while (!rawJson.endsWith("}"))
    {
      rawJson = rawJson.substr(0, rawJson.length - 1);
    }

    return parseJSONshit(rawJson);
  }

}
