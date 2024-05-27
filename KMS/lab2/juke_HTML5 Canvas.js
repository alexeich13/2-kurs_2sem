(function (cjs, an) {

var p; // shortcut to reference prototypes
var lib={};var ss={};var img={};
lib.ssMetadata = [
		{name:"juke_HTML5 Canvas_atlas_1", frames: [[1717,190,76,110],[1619,190,96,132],[433,237,453,137],[1589,398,447,59],[433,0,459,235],[894,0,250,418],[1795,190,68,108],[1146,398,441,100],[0,376,492,117],[494,420,513,73],[1146,228,471,168],[0,0,431,287],[1599,0,436,188],[1146,0,451,226]]}
];


(lib.AnMovieClip = function(){
	this.currentSoundStreamInMovieclip;
	this.actionFrames = [];
	this.soundStreamDuration = new Map();
	this.streamSoundSymbolsList = [];

	this.gotoAndPlayForStreamSoundSync = function(positionOrLabel){
		cjs.MovieClip.prototype.gotoAndPlay.call(this,positionOrLabel);
	}
	this.gotoAndPlay = function(positionOrLabel){
		this.clearAllSoundStreams();
		this.startStreamSoundsForTargetedFrame(positionOrLabel);
		cjs.MovieClip.prototype.gotoAndPlay.call(this,positionOrLabel);
	}
	this.play = function(){
		this.clearAllSoundStreams();
		this.startStreamSoundsForTargetedFrame(this.currentFrame);
		cjs.MovieClip.prototype.play.call(this);
	}
	this.gotoAndStop = function(positionOrLabel){
		cjs.MovieClip.prototype.gotoAndStop.call(this,positionOrLabel);
		this.clearAllSoundStreams();
	}
	this.stop = function(){
		cjs.MovieClip.prototype.stop.call(this);
		this.clearAllSoundStreams();
	}
	this.startStreamSoundsForTargetedFrame = function(targetFrame){
		for(var index=0; index<this.streamSoundSymbolsList.length; index++){
			if(index <= targetFrame && this.streamSoundSymbolsList[index] != undefined){
				for(var i=0; i<this.streamSoundSymbolsList[index].length; i++){
					var sound = this.streamSoundSymbolsList[index][i];
					if(sound.endFrame > targetFrame){
						var targetPosition = Math.abs((((targetFrame - sound.startFrame)/lib.properties.fps) * 1000));
						var instance = playSound(sound.id);
						var remainingLoop = 0;
						if(sound.offset){
							targetPosition = targetPosition + sound.offset;
						}
						else if(sound.loop > 1){
							var loop = targetPosition /instance.duration;
							remainingLoop = Math.floor(sound.loop - loop);
							if(targetPosition == 0){ remainingLoop -= 1; }
							targetPosition = targetPosition % instance.duration;
						}
						instance.loop = remainingLoop;
						instance.position = Math.round(targetPosition);
						this.InsertIntoSoundStreamData(instance, sound.startFrame, sound.endFrame, sound.loop , sound.offset);
					}
				}
			}
		}
	}
	this.InsertIntoSoundStreamData = function(soundInstance, startIndex, endIndex, loopValue, offsetValue){ 
 		this.soundStreamDuration.set({instance:soundInstance}, {start: startIndex, end:endIndex, loop:loopValue, offset:offsetValue});
	}
	this.clearAllSoundStreams = function(){
		var keys = this.soundStreamDuration.keys();
		for(var i = 0;i<this.soundStreamDuration.size; i++){
			var key = keys.next().value;
			key.instance.stop();
		}
 		this.soundStreamDuration.clear();
		this.currentSoundStreamInMovieclip = undefined;
	}
	this.stopSoundStreams = function(currentFrame){
		if(this.soundStreamDuration.size > 0){
			var keys = this.soundStreamDuration.keys();
			for(var i = 0; i< this.soundStreamDuration.size ; i++){
				var key = keys.next().value; 
				var value = this.soundStreamDuration.get(key);
				if((value.end) == currentFrame){
					key.instance.stop();
					if(this.currentSoundStreamInMovieclip == key) { this.currentSoundStreamInMovieclip = undefined; }
					this.soundStreamDuration.delete(key);
				}
			}
		}
	}

	this.computeCurrentSoundStreamInstance = function(currentFrame){
		if(this.currentSoundStreamInMovieclip == undefined){
			if(this.soundStreamDuration.size > 0){
				var keys = this.soundStreamDuration.keys();
				var maxDuration = 0;
				for(var i=0;i<this.soundStreamDuration.size;i++){
					var key = keys.next().value;
					var value = this.soundStreamDuration.get(key);
					if(value.end > maxDuration){
						maxDuration = value.end;
						this.currentSoundStreamInMovieclip = key;
					}
				}
			}
		}
	}
	this.getDesiredFrame = function(currentFrame, calculatedDesiredFrame){
		for(var frameIndex in this.actionFrames){
			if((frameIndex > currentFrame) && (frameIndex < calculatedDesiredFrame)){
				return frameIndex;
			}
		}
		return calculatedDesiredFrame;
	}

	this.syncStreamSounds = function(){
		this.stopSoundStreams(this.currentFrame);
		this.computeCurrentSoundStreamInstance(this.currentFrame);
		if(this.currentSoundStreamInMovieclip != undefined){
			var soundInstance = this.currentSoundStreamInMovieclip.instance;
			if(soundInstance.position != 0){
				var soundValue = this.soundStreamDuration.get(this.currentSoundStreamInMovieclip);
				var soundPosition = (soundValue.offset?(soundInstance.position - soundValue.offset): soundInstance.position);
				var calculatedDesiredFrame = (soundValue.start)+((soundPosition/1000) * lib.properties.fps);
				if(soundValue.loop > 1){
					calculatedDesiredFrame +=(((((soundValue.loop - soundInstance.loop -1)*soundInstance.duration)) / 1000) * lib.properties.fps);
				}
				calculatedDesiredFrame = Math.floor(calculatedDesiredFrame);
				var deltaFrame = calculatedDesiredFrame - this.currentFrame;
				if(deltaFrame >= 2){
					this.gotoAndPlayForStreamSoundSync(this.getDesiredFrame(this.currentFrame,calculatedDesiredFrame));
				}
			}
		}
	}
}).prototype = p = new cjs.MovieClip();
// symbols:



(lib.CachedBmp_23 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(0);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_19 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(1);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_9 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(2);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_8 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(3);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_10 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(4);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_11 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(5);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_15 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(6);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_7 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(7);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_2 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(8);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_1 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(9);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_3 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(10);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_5 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(11);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_6 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(12);
}).prototype = p = new cjs.Sprite();



(lib.CachedBmp_4 = function() {
	this.initialize(ss["juke_HTML5 Canvas_atlas_1"]);
	this.gotoAndStop(13);
}).prototype = p = new cjs.Sprite();



(lib.stop = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Слой_1
	this.instance = new lib.CachedBmp_23();
	this.instance.setTransform(-20.5,-23.45,0.5,0.5);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({x:-19.5},0).wait(3));

	this._renderFirstFrame();

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-20.5,-23.4,39,55);


(lib.start = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Слой_1
	this.instance = new lib.CachedBmp_19();
	this.instance.setTransform(-24,-29.95,0.5,0.5);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(4));

	this._renderFirstFrame();

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-24,-29.9,48,66);


(lib.restart = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Слой_1
	this.instance = new lib.CachedBmp_15();
	this.instance.setTransform(-16,-19.95,0.5,0.5);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(4));

	this._renderFirstFrame();

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-16,-19.9,34,54);


(lib.Символ3 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Слой_1
	this.instance = new lib.CachedBmp_11();
	this.instance.setTransform(-62,-99.95,0.5,0.5);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

	this._renderFirstFrame();

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-62,-99.9,125,209);


(lib.Символ1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Слой_1
	this.instance = new lib.CachedBmp_1();
	this.instance.setTransform(-137.4,0,0.5,0.5);

	this.instance_1 = new lib.CachedBmp_2();
	this.instance_1.setTransform(-127.05,-26.95,0.5,0.5);

	this.instance_2 = new lib.CachedBmp_3();
	this.instance_2.setTransform(-116.7,-54.9,0.5,0.5);

	this.instance_3 = new lib.CachedBmp_4();
	this.instance_3.setTransform(-106.4,-84.35,0.5,0.5);

	this.instance_4 = new lib.CachedBmp_5();
	this.instance_4.setTransform(-96.15,-114.75,0.5,0.5);

	this.instance_5 = new lib.CachedBmp_6();
	this.instance_5.setTransform(-99.25,-66.5,0.5,0.5);

	this.instance_6 = new lib.CachedBmp_7();
	this.instance_6.setTransform(-102.45,-21.05,0.5,0.5);

	this.instance_7 = new lib.CachedBmp_8();
	this.instance_7.setTransform(-105.75,12,0.5,0.5);

	this.instance_8 = new lib.CachedBmp_9();
	this.instance_8.setTransform(-109.3,21.55,0.5,0.5);

	this.instance_9 = new lib.CachedBmp_10();
	this.instance_9.setTransform(-112.95,21.65,0.5,0.5);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance_1}]},1).to({state:[{t:this.instance_2}]},1).to({state:[{t:this.instance_3}]},1).to({state:[{t:this.instance_4}]},1).to({state:[{t:this.instance_5}]},1).to({state:[{t:this.instance_6}]},1).to({state:[{t:this.instance_7}]},1).to({state:[{t:this.instance_8}]},1).to({state:[{t:this.instance_9}]},1).wait(1));

	this._renderFirstFrame();

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-137.4,-114.7,256.8,253.89999999999998);


(lib.Символ2 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Слой_1
	this.instance = new lib.Символ1("synched",0);
	this.instance.setTransform(-122.95,-22.2,0.8193,0.7867,-6.7622,0,0,114.4,27.3);

	this.instance_1 = new lib.Символ1("synched",2);
	this.instance_1.setTransform(-116.05,23,0.781,0.6391,-31.6713,0,0,119.5,28.2);

	this.instance_2 = new lib.Символ1("synched",1);
	this.instance_2.setTransform(-2.25,31.15,0.7538,0.5164,0,21.0213,-158.9791,113.5,31.4);

	this.instance_3 = new lib.Символ1("synched",2);
	this.instance_3.setTransform(5.4,-35.8,0.8445,0.6683,0,5.7332,-174.2674,113.2,27.6);

	this.instance_4 = new lib.Символ1("synched",0);
	this.instance_4.setTransform(-11.9,-73.05,0.8829,0.7941,0,-7.975,172.0253,116,25.5);

	this.instance_5 = new lib.Символ1("synched",1);
	this.instance_5.setTransform(-116.95,-65,0.8181,0.6041,14.9967,0,0,112.7,20.9);

	this.instance_6 = new lib.Символ3("synched",0);
	this.instance_6.setTransform(-60,-12,1,1,0,0,0,0.5,4.5);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance_6},{t:this.instance_5,p:{startPosition:1}},{t:this.instance_4,p:{startPosition:0}},{t:this.instance_3,p:{startPosition:2}},{t:this.instance_2,p:{startPosition:1}},{t:this.instance_1,p:{startPosition:2}},{t:this.instance,p:{startPosition:0}}]}).to({state:[{t:this.instance_6},{t:this.instance_5,p:{startPosition:0}},{t:this.instance_4,p:{startPosition:9}},{t:this.instance_3,p:{startPosition:1}},{t:this.instance_2,p:{startPosition:0}},{t:this.instance_1,p:{startPosition:1}},{t:this.instance,p:{startPosition:9}}]},9).wait(1));

	this._renderFirstFrame();

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330.3,-209.3,548.1,387.9);


// stage content:
(lib.juke_HTML5Canvas = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	this.actionFrames = [0,20,21,59];
	// timeline functions:
	this.frame_0 = function() {
		this.clearAllSoundStreams();
		 
		/* this.stop();
		function f1(event: MouseEvent): void {
		  play();
		}
		
		but1.addEventListener(MouseEvent.CLICK, f1);
		function f2(event: MouseEvent): void {
		  stop();
		}
		but2.addEventListener(MouseEvent.CLICK, f2);
		function f3(event: MouseEvent): void {
		  gotoAndStop(0);
		}
		but3.addEventListener(MouseEvent.CLICK, f3);*/
		this.stop();
		this.but1.addEventListener("click",f1.bind(this));
		function f1(args){this.play();}
		this.but2.addEventListener("click",f2.bind(this));
		function f2(args){this.stop();}
		this.but3.addEventListener("click",f3.bind(this));
		function f3(args){this.gotoAndStop(0);}
	}
	this.frame_20 = function() {
		playSound("большой");
	}
	this.frame_21 = function() {
		playSound("мелкий");
	}
	this.frame_59 = function() {
		playSound("_5b1e2fcc1ecee76");
		playSound("_5b1e2fcc1ecee76");
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).call(this.frame_0).wait(20).call(this.frame_20).wait(1).call(this.frame_21).wait(38).call(this.frame_59).wait(1));

	// Слой_3
	this.but2 = new lib.stop();
	this.but2.name = "but2";
	this.but2.setTransform(404.5,32);
	new cjs.ButtonHelper(this.but2, 0, 1, 2, false, new lib.stop(), 3);

	this.but1 = new lib.start();
	this.but1.name = "but1";
	this.but1.setTransform(287,30.7,0.5833,0.7226);
	new cjs.ButtonHelper(this.but1, 0, 1, 2, false, new lib.start(), 3);

	this.but3 = new lib.restart();
	this.but3.name = "but3";
	this.but3.setTransform(348,27);
	new cjs.ButtonHelper(this.but3, 0, 1, 2, false, new lib.restart(), 3);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.but3},{t:this.but1},{t:this.but2}]}).wait(60));

	// Слой_7
	this.instance = new lib.Символ2();
	this.instance.setTransform(395,403,0.196,0.2928,139.5552,0,0,-57.6,-41.1);

	this.timeline.addTween(cjs.Tween.get(this.instance).to({regX:-57.4,regY:-41.3,rotation:87.3383,guide:{path:[395,403,370.5,373.4,336,356.1,321.4,348.8,307.9,340.3,272.9,318.4,233.7,327.9,197.9,336.6,159.1,336.1,155.1,336.1,151.1,336.1,130.6,328.1,110.1,320.1,98.6,316.6,87.1,313.1,81.6,313.1,76.1,313.1,65.1,303.6,54.1,294.1,52.6,294.1,51.1,294.1,47.6,260.1,44.1,226.1,29.1,189.6,14.1,153.2,14.1,97.7,14.1,42.2,19.6,41.7,20.2,41.5,23.1,41.5,26.1,41.5,26.1,34.3,26.1,27.2,28.6,27.2,31.1,27.2,33.7,20.6,34.6,17,35.7,9.2,34.4,7,30.7,7,27.1,7]}},59).wait(1));

	// Слой_5
	this.instance_1 = new lib.Символ2();
	this.instance_1.setTransform(115,9.05,0.1662,0.2122,90,0,0,-57.8,-40.8);

	this.timeline.addTween(cjs.Tween.get(this.instance_1).to({regX:-58,regY:-40.6,scaleY:0.2121,rotation:-77.8462,guide:{path:[115.1,9.2,103.6,9.2,92.1,9.2,67.6,33.2,43.1,57.2,26.6,81.7,41.6,110.9,52.7,132.4,63.1,153.1,71.1,163.6,79.1,174.1,103.1,191.6,127.1,209.1,169.6,217.1,212,225.1,229.5,217.6,247,210.1,267.7,206.9,288.5,210.6,304,213.2,314.8,222.1,322.8,228.6,329,237.1,331,237.1,333,237.1,359.9,256.4,391.4,243.6,398.1,240.8,404.6,237.7], orient:'fixed'}},35).to({regX:-57.9,regY:-40.8,rotation:-171.0364,guide:{path:[404.6,237.7,429.4,225.9,451,209.1,455,209.1,459,209.1,464.5,217.3,470,225.5], orient:'fixed'}},5).to({regX:-57.6,regY:-40.7,rotation:-328.0042,guide:{path:[470.1,225.5,477,235.8,484,246.1,493.5,265.6,503,285.1,505,291.9,507.1,298.8], orient:'fixed'}},5).to({regX:-57.8,regY:-40.8,scaleY:0.2122,rotation:-450,guide:{path:[507.1,298.8,512.6,317.4,518.1,336,522.6,347,527.1,358,527.1,377.5,527.1,397,531.1,397,535.1,397,543.1,406.5,551.1,416,556.6,416,562.1,416,562.1,418,562.1,420,570.6,423,579.1,426,588.1,441.5,597.1,457,605.6,457,614.1,457,621.5,460.6,623.5,456.7], orient:'fixed'}},14).wait(1));

	// Слой_2
	this.instance_2 = new lib.Символ2();
	this.instance_2.setTransform(14.1,455.1,0.2912,0.3859,-160.4996,0,0,-57.8,-40.8);

	this.timeline.addTween(cjs.Tween.get(this.instance_2).to({regY:-40.6,rotation:-165.001,guide:{path:[14.1,455.1,25.6,417.1,37.1,379.1,55.7,378.5,74.1,378.2,111.1,377.6,137.8,401.6,152.4,414.8,169.1,424.1,169.1,425.6,169.1,427.1,174.7,427.1,180.2,427.1,192.7,433.1,205.2,439.1,286.7,449.6,368.1,460.1,374.6,460.1,381.1,460.1,381.1,463.6,381.1,467.1,388.1,467.1,395.1,467.1,395.1,470.6,395.1,474.1,405.2,477,413.4,479,421.5,481.1,429.2,478.3,435.9,475.8,442.1,474.1,447.1,471.1,448.1,471.1,452.1,467.6,453.2,467.3,459.7,453.2,466.1,439.1,466.1,397.1,466.1,355.1,468.1,355.1,470.1,355.1,464.1,315.1,458.1,275.1,458.1,265.6,458.1,256.1,464.1,254.6,464.9,253.8,464.9,244.5,464.9,235.2,445.4,219.8,418.3,214.4,358.7,202.4,315.1,162.2,315.1,154.7,315.1,147.2,376.6,152.2,438.1,157.2,463.1,152.2,488.1,147.2,517.1,126.7,546.1,106.2,546.1,104.2,546.1,102.2,548.1,102.2,550.1,102.2,568.2,76.6,586.2,51.1,591.7,48.1,592.2,48.1,599.2,44.1,606.2,40.1,608.2,40.1,610.2,40.1,615.2,37.1,620.2,34.1,622.7,34.1,625.2,34.1,625.2,28.6,625.2,28.1,627.2,22.6,627.2,22.1,628.1,16.7,628.3,16.2], orient:'fixed'}},59).wait(1));

	this._renderFirstFrame();

}).prototype = p = new lib.AnMovieClip();
p.nominalBounds = new cjs.Rectangle(250.8,188.2,458.3,370.40000000000003);
// library properties:
lib.properties = {
	id: '5479BFDCAEE16D45AC5394B5281627A0',
	width: 640,
	height: 480,
	fps: 30,
	color: "#FFFFFF",
	opacity: 1.00,
	manifest: [
		{src:"images/juke_HTML5 Canvas_atlas_1.png?1678810911178", id:"juke_HTML5 Canvas_atlas_1"},
		{src:"sounds/большой_.mp3?1678810911201", id:"большой"},
		{src:"sounds/_5b1e2fcc1ecee76.mp3?1678810911201", id:"_5b1e2fcc1ecee76"},
		{src:"sounds/мелкий_.mp3?1678810911201", id:"мелкий"}
	],
	preloads: []
};



// bootstrap callback support:

(lib.Stage = function(canvas) {
	createjs.Stage.call(this, canvas);
}).prototype = p = new createjs.Stage();

p.setAutoPlay = function(autoPlay) {
	this.tickEnabled = autoPlay;
}
p.play = function() { this.tickEnabled = true; this.getChildAt(0).gotoAndPlay(this.getTimelinePosition()) }
p.stop = function(ms) { if(ms) this.seek(ms); this.tickEnabled = false; }
p.seek = function(ms) { this.tickEnabled = true; this.getChildAt(0).gotoAndStop(lib.properties.fps * ms / 1000); }
p.getDuration = function() { return this.getChildAt(0).totalFrames / lib.properties.fps * 1000; }

p.getTimelinePosition = function() { return this.getChildAt(0).currentFrame / lib.properties.fps * 1000; }

an.bootcompsLoaded = an.bootcompsLoaded || [];
if(!an.bootstrapListeners) {
	an.bootstrapListeners=[];
}

an.bootstrapCallback=function(fnCallback) {
	an.bootstrapListeners.push(fnCallback);
	if(an.bootcompsLoaded.length > 0) {
		for(var i=0; i<an.bootcompsLoaded.length; ++i) {
			fnCallback(an.bootcompsLoaded[i]);
		}
	}
};

an.compositions = an.compositions || {};
an.compositions['5479BFDCAEE16D45AC5394B5281627A0'] = {
	getStage: function() { return exportRoot.stage; },
	getLibrary: function() { return lib; },
	getSpriteSheet: function() { return ss; },
	getImages: function() { return img; }
};

an.compositionLoaded = function(id) {
	an.bootcompsLoaded.push(id);
	for(var j=0; j<an.bootstrapListeners.length; j++) {
		an.bootstrapListeners[j](id);
	}
}

an.getComposition = function(id) {
	return an.compositions[id];
}


an.makeResponsive = function(isResp, respDim, isScale, scaleType, domContainers) {		
	var lastW, lastH, lastS=1;		
	window.addEventListener('resize', resizeCanvas);		
	resizeCanvas();		
	function resizeCanvas() {			
		var w = lib.properties.width, h = lib.properties.height;			
		var iw = window.innerWidth, ih=window.innerHeight;			
		var pRatio = window.devicePixelRatio || 1, xRatio=iw/w, yRatio=ih/h, sRatio=1;			
		if(isResp) {                
			if((respDim=='width'&&lastW==iw) || (respDim=='height'&&lastH==ih)) {                    
				sRatio = lastS;                
			}				
			else if(!isScale) {					
				if(iw<w || ih<h)						
					sRatio = Math.min(xRatio, yRatio);				
			}				
			else if(scaleType==1) {					
				sRatio = Math.min(xRatio, yRatio);				
			}				
			else if(scaleType==2) {					
				sRatio = Math.max(xRatio, yRatio);				
			}			
		}			
		domContainers[0].width = w * pRatio * sRatio;			
		domContainers[0].height = h * pRatio * sRatio;			
		domContainers.forEach(function(container) {				
			container.style.width = w * sRatio + 'px';				
			container.style.height = h * sRatio + 'px';			
		});			
		stage.scaleX = pRatio*sRatio;			
		stage.scaleY = pRatio*sRatio;			
		lastW = iw; lastH = ih; lastS = sRatio;            
		stage.tickOnUpdate = false;            
		stage.update();            
		stage.tickOnUpdate = true;		
	}
}
an.handleSoundStreamOnTick = function(event) {
	if(!event.paused){
		var stageChild = stage.getChildAt(0);
		if(!stageChild.paused){
			stageChild.syncStreamSounds();
		}
	}
}


})(createjs = createjs||{}, AdobeAn = AdobeAn||{});
var createjs, AdobeAn;