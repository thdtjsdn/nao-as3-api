package aerys.nao.utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	public dynamic class ProxyEventDispatcher extends Proxy implements IEventDispatcher
	{
		private var _eventDispatcher	: EventDispatcher	= new EventDispatcher();
		
		protected function get eventDispatcher() : EventDispatcher	{ return _eventDispatcher; }
		
		public function ProxyEventDispatcher()
		{
			super();
		}
		
		public function addEventListener(type				: String,
										 listener			: Function,
										 useCapture			: Boolean	= false,
										 priority			: int		= 0,
										 useWeakReference	: Boolean	= false) : void
		{
			_eventDispatcher.addEventListener(type,
										 	  listener,
											  useCapture,
											  priority,
											  useWeakReference);
		}
		
		public function removeEventListener(type		: String,
											listener	: Function,
											useCapture	: Boolean	= false) : void
		{
			_eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event	: Event) : Boolean
		{
			return willTrigger(event.type)
				   ? _eventDispatcher.dispatchEvent(event.clone())
				   : false;
		}
		
		public function hasEventListener(type : String) : Boolean
		{
			return _eventDispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type : String) : Boolean
		{
			return _eventDispatcher.willTrigger(type);
		}
		
		override flash_proxy function getProperty(name : *) : *
		{
			return getProperty(name);
		}
		
		override flash_proxy function callProperty(name : *, ...parameters) : *
		{
			return callProperty.apply(this, [name, parameters]);
		}
		
		protected function getProperty(name : *) : *
		{
			throw new Error();
		}
		
		protected function callProperty(name : *, ...parameters) : *
		{
			throw new Error();
		}
		
		protected function setProperty(name : *, value : *) : void
		{
			throw new Error();
		}
	}
}