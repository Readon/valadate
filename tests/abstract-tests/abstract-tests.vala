namespace Valadate.Tests {

	public abstract class AbstractTests : TestCase {
	
		protected ObjectFactory factory;
	
		protected string mysteryanimal;
	
		public override void set_up() {
			factory = new ObjectFactory();
		}
	
		public virtual void test_get_yak() throws FactoryError {
			
			var yak = factory.get_object("yak");
			
			assert(yak is TestObject);
			assert(yak.name == "yak");
		}
	
		public virtual void test_get_dog() throws FactoryError {
			
			var dog = factory.get_object("dog");
			
			assert(dog is TestObject);
			assert(dog.name == "dog");
		}

		public virtual void test_get_chicken() throws FactoryError {
			
			var chicken = factory.get_object("chicken");
			
			assert(chicken is TestObject);
			assert(chicken.name == "chicken");
		}
	
		public virtual void test_get_goat() throws FactoryError {
			
			var goat = factory.get_object("goat");
			
			assert(goat is TestObject);
			assert(goat.name == "goat");
		}
	
		public virtual void test_get_duck() throws FactoryError {
			
			var duck = factory.get_object("duck");
			
			assert(duck is TestObject);
			assert(duck.name == "duck");
		}

		public virtual void test_get_mystery_animal() throws FactoryError {
			
			var mystery = factory.get_object(mysteryanimal);
			
			assert(mystery is TestObject);
			assert(mystery.name == mysteryanimal);
		}
	
		public virtual void test_get_crocodile() throws FactoryError {
			
			try {
				var crocodile = factory.get_object("crocodile");
				assert_not_reached();
			} catch (Error e) {
				assert(e.message == "The object crocodile was not found!");
			}
		}
	
	
	}

}
