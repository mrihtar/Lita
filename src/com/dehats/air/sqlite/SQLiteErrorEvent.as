package com.dehats.air.sqlite
{
	import flash.events.Event;

	public class SQLiteErrorEvent extends Event
	{
		public static const EVENT_ERROR:String ="SQLiteErrorEvent"
		
		public var error:Error;
		public var statement:String
		
		public function SQLiteErrorEvent(type:String, pError:Error, pStatement:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			error = pError;
			statement = pStatement;
			
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new SQLiteErrorEvent(type, error, statement, bubbles, cancelable);
		}
		
	}
}