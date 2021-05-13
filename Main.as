package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite {
		
		public function Main () {
			const NUMBER_OF_TILES:uint = 20;//Неизменное количество тайлов
			const TILES_PER_ROW:uint = 5;//Тайлов в каждом ряду 
			var tile:tile_movieclip;// Тайл, как ребенок класса tile_movieclip
			var tiles:Array = new Array ();// Массив, содержащий тайлы
			stage.addEventListener(MouseEvent.CLICK, onTileClicked);
			
			for (var i:uint=0; i<NUMBER_OF_TILES; i++) { /* Цикл вставляющий 
			                                                                           тайлы в массив*/
				tiles.push(Math.floor(i/2));
			}
			//Цикл перемешивания
			var swap,tmp:uint;
			for (i=NUMBER_OF_TILES-1; i>0; i--) {
				swap=Math.floor(Math.random()*i);
				tmp=tiles[i];
				tiles[i]=tiles[swap];
				tiles[swap]=tmp;
			}
			trace("My tiles: "+tiles);
			trace("my shuffled tiles: "+tiles);
			
			//Цикл помещения тайлов 
			for (i=0; i<NUMBER_OF_TILES; i++) {
				tile=new tile_movieclip();
				addChild(tile);
				tile.cardType = tiles[i];
				tile.x=5+(tile.width+5)*(i%TILES_PER_ROW);
				tile.y=5+(tile.height+5)*(Math.floor(i/TILES_PER_ROW));
				tile.gotoAndStop(NUMBER_OF_TILES/2+1);
				tile.buttonMode = true;
				tile.addEventListener(MouseEvent.CLICK, onTileClicked);
			}
			
			
			
		}
		private function onTileClicked (e:MouseEvent):void {
				trace("You picked a "+e.currentTarget.cardType);
				e.currentTarget.gotoAndStop(e.currentTarget.cardType+1);
			}
		
		
		
	}
	
}