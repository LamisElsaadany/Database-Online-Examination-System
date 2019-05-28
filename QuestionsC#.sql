--@question nvarchar(50),
--@labl1 char(1),
--@Choic1 nvarchar(30),
--@labl2 char(1),
--@Choic2 nvarchar(30),
--@ModelAns char(1),
--@Level char(1),
--@Type bit,
--@grade float

exec enterquestionTF 'A function can return more than one value'
					,'a','True','b','False','b','L',True,2

exec enterquestionTF 'In C#, a function needs to be defined using the static keyword, so that it can be called from the Main function'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'If a function returns no value, the return type must be declared as void.'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'A function can return more than one value'
					,'a','True','b','False','b','L',True,2

exec enterquestionTF 'In a function, The return statement is not required if the return type is anything other than void.'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF '-A local variable declared in a function is not usable out side that function.'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'A function can have more than one parameter. Values of the parameters are passed to the function when it is called.'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'in C#, A function can be overloaded. Overloading a function means you can give the same name to many function, but different in their arguments.'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'In a HashTable Key cannot be null, but Value can be.'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'String is a type of reference:'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'Double is a type of value'
					,'a','True','b','False','a','L',True,2

exec enterquestionTF 'Struct is a custom value type'
					,'a','True','b','False','b','h',True,2

exec enterquestionTF 'Can a class have more than one direct base class'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'Protected makes a member visible to inherited classes'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'Internal makes a class visible only within its assembly'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'virtual keyword allows a method to be overridden'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'abstract keyword requires a method to be overridden'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'sealed keyword prevents a class from being used as a base class'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'is keyword returns true if a cast will succeed'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'as keyword returns null if a cast will not succeed'
					,'a','True','b','False','a','h',True,2

exec enterquestionTF 'finally keyword ensures code execution even if an exception occurs'
					,'a','True','b','False','a','h',True,2

-----------------------------------------------------------------------------------------------

--@question nvarchar(50),
--@labl1 char(1),
--@Choic1 nvarchar(30),
--@labl2 char(1),
--@Choic2 nvarchar(30),
--@labl3 char(1),
--@Choic3 nvarchar(30),
--@ModelAns char(1),
--@Level char(1),
--@Type bit,
--@grade float


exec enterquestionMCQ 'Which Of The Following Can Be Used To Define The Member Of A Class Externally'
					,'a',':','b','::','c','#','b','L',False,5


exec enterquestionMCQ 'Which Of The Following Operator Can Be Used To Access The Member Function Of A Class?'
					,'a',':','b','::','c','#','c','L',False,5

exec enterquestionMCQ 'Which Of The Following Gives The Correct Count Of The Constructors That A Class Can Define?'
					,'a','1','b','2','c','Any Number','c','L',False,5

exec enterquestionMCQ 'Which Of The Following Statements Correctly Tell The Differences Between ‘=’ And ‘==’ In C#?'
					,'a','‘==’ operator is used to assign values from one variable to another variable
				‘=’ operator is used to compare value between two variables',
				'b','‘=’ operator is used to assign values from one variable to another variable
				‘==’ operator is used to compare value between two variables','c',
				'No difference between both operators','b','L',False,5

exec enterquestionMCQ 'What Is The Correct Name Of A Method Which Has The Same Name As That Of Class And Used To Destroy Objects?'
					,'a','Constructor','b','Finalize()','c','Destructor','c','L',False,5

exec enterquestionMCQ 'Which one of the following statements is correct?'
					,'a','Array elements can be of integer type only.',
					'b','The rank of an Array is the total number of elements it can contain.',
					'c','The default value of numeric array elements is zero.','c','L',False,5

exec enterquestionMCQ 'Which of the following statements are correct about arrays used in C#.NET?
					1-Arrays can be rectangular or jagged.
					2-Rectangular arrays have similar rows stored in adjacent memory locations.
					3-Jagged arrays do not have an access to the methods of System.Array Class.
					4-Rectangular arrays do not have an access to the methods of System.Array Class.
					5-Jagged arrays have dissimilar rows stored in non-adjacent memory locations.
					'
					,'a','1,2','b','3,4','c','1,2,5','c','L',False,5

exec enterquestionMCQ 'How many enumerators will exist if four threads are simultaneously working on an ArrayList object?'
					,'a','1','b','3','c','4','c','L',False,5

exec enterquestionMCQ 'A HashTable t maintains a collection of names of states and capital city of each state. Which of the following is the correct way to find out whether "Kerala" state is present in this collection or not?'
					,'a','t.ContainsKey("Kerala");','b','t.HasValue("Kerala");',
					'c','t.HasKey("Kerala");','a','L',False,5

exec enterquestionMCQ 'Which of the following is NOT an interface declared in System.Collections namespace?'
					,'a','IComparer','b','IEnumerable','c','IDictionaryComparer','c','L',False,5

exec enterquestionMCQ 'Which of the following statements are correct about the Collection Classes available in Framework Class Library?'
					,'a','Elements of a collection cannot be transmitted over a network.','b',
					'Elements stored in a collection can be modified only if allelements are of similar types.',
					'c','They use efficient algorithms to manage the collection, thereby improving the performance of the program.','c','L',False,5





























