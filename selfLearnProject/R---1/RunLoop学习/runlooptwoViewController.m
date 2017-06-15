//
//  runlooptwoViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/5/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "runlooptwoViewController.h"

@interface runlooptwoViewController ()

@end

@implementation runlooptwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
//MARK: 面试题梳理
//MARK:1.oc的理解与特性
    /*1.OC 是一门面向对象的语言，具有面向对象的语言特性：封装，继承，多态。它具有静态语言的特性和动态语言的效率
     2.OC 具有相当多的动态特性，表现为1.动态类型（id） ，动态绑定(实例对象确定以后，类型被确定)，动态加载（图片选几倍的啊）--  运行时的主要内容*/
//MARK:2.内存管理基本原则
    /*5.0以前用MRC 遵循 谁创建，谁释放，谁引用，谁管理的原则*/
    /*alloc,copy(mutableCopy),retian --- release或者autorelease*/
    /*autorelease 自动释放池 并不能直接释放，会在池子释放时将其内部的算有对象一一释放*/
    /*__strong 对象不能释放，引用计数加一*/
    /*一个视图控制器在被释放时，其内部的所有指针指向nil*/
    /*局部变量：出了作用域，指针会被指向nil*/
    /*代理使用unsafe_unretained就相当于assign,现在都用week*/
    /*block中为了避免循环引用，使用__weak描述*/
    /*声明属性时候，不要以new开头，否则需要自己写get方法*/
    /*@sutoreleasepool{}*/
    /*ARC只能管理Foundation框架*/
    /*非ARC 环境，采用ARC去编译某些类 -fobjc-arc*/
    /*在ARC下采用非ARC,-fno-fobjc-arc*/
    
    /*之后用ARC 自动管理机制*/
    
 //MARK:3.MVC设计模式理解
    /*Model View Controller 模式*/
//MARK: 4.Objective-C 是否支持垃圾回收机制
    /*1.支持
     2.但是移动端不支持，mac端支持
     3.移动端是ARC ，简化了内存管理难度*/
//MARK:5.协议的基本概念和协议中方法默认为什么类型
    /*1.基本概念：是一个方法列表，并且多少有点相关。特点是可以被任何类使用和实现，但本身不是类，自己不实现方法，又有其他类来实现
     2.默认为为@required 必须实现 如果要可选，加@optional*/
 //MARK:6.简述category 优缺点
    /*优点：1不通过增加子类或者现有类的方法，且勒种的方法和原始类的方法区别不大
     2.通过类目，可以将庞大的一个类的方法进行划分，从而便于代码的日后的维护和更新，以及提高代码的阅读性*
     *缺点：1.无法向类目添加实例变量，如果有需要，只能通过定义子类的方式
     2.类目中的方法与原始类及其父类的方法相比，具有更高的优先级，如果覆盖父类的方法，可能会导致super消息的断裂，因此最好不要覆盖原始类的方法*/

//MARK:7.类别的作用
    
    /*1.g给系统原有类添加方法
     2.分散类实现
     3.声明私有方法
     4.不能添加变量，property描述setter方法就不能报错*/
//MARK:8.循环引用的原因以及解决办法
    /*两个对象产生了相互引用*/
    /*1.事先知道会存在循环引用，在合理的地方实现主动断开
     2。 weak 
     */
//MARK:9.KVO
    /*KVO底层是runtime走的set方法 用 p.age 能监听到 p->age就不能监听到*/
    /*1.在既定的实体中，同一属性的所有值，具有相同的数据类型
      2.是一种间接访问对象属性的机制
     3.键路径是由点做分隔符的键组成的字符串，用于指定一个连接在一起的对象性质序列，第一个键的性质是由先前的性质决定的，接下来每个键的值也是相对于前面的性质
     4.键路径是您可以独立于模型实现的方式指定相关对象的性质。通过建路径，您可以指定对象图中的任意深度的路径，使其指向相关对象的特定属性。
     5.键值编码是一种间接访问对象的属性使用字符串来标识属性，而不是通过调用存取方法，直接或者通过实例变量访问的机制，非对象类型的变量会被自动封装或者解封成对象，很多情况下会简化程序代码
     6.缺点：一旦使用KVC你的编译器无法检查处错误，不能对设置的键，键路径进行错误检查，并且执行效率低于合成存取器方法和自定的setter 和getter方法。因为使用KVC键值编码，它必须先解析字符串，然后在设置或者访问对象的实例变量
     */
//MARK:10.KVC机制通过key找到value的原理
    /*[self valueForKey:@”someKey”]为例
     1.县查找对象是否带有somekey这个方法，如果没有，会继续查找对象是否会有someKey这个实例变量，如果没有找到，会继续试图调用-(id)valueForUndefinedKey:这个方法。如果没有找到（没有实现）,程序会抛出一个NSUndefinedKeyException异常错误
     2.还会查找getsomeKey这个方法*/
    
//MARK:11.实现KVO
    /*1.添加观察者， addObserver 
      2.接受变更通知  observeValueForKeyPath
      3.移除对象观察者 removeObserver*/
    
 //MARK:12.代理的作用
    /*代理是一种设计模式，对象与对象之间的通信交互，代理解除了对象之间的耦合性
     改变或者传递控制。允许一个类在某些特定时刻通知到其他的类，而不需要获取到哪些类的指针。可以减少框架的复杂度
     代理现在都用weak 不在用 assign*/
//MARK:13.NSNotification、Block、Delegate和KVO的区别。
    /*1.代理是中回调机制，并且是一对一关系，通知是一对多关系，一个对象的所有的观察者提供变更通知
     2.效率上，代理比通知要高
     3.代理和block是一对一通信
     4.代理需要 协议方法，代理对象，代理对象实现协议方法，确定代理关系
     5.block 相对简洁，但是通信事件多的话还是使用代理比较好*/
//MARK:14.当我们调用一个静态方法时候，需要对对象进行release么？
    /*不需要，静态方法创建一个对象的时候，对象已经被放入了自动释放池*/
//MARK:15.当我们释放我们的对象时,为什么需要调用[super dealloc]方法,它的位置又是如何的呢?
    /*因为子类的某些市里是继承父类的，因此需要调用[super dealloc]，其实也就是子类本身的，一般来说我们优先释放子类拥有的实例，最后再释放父类的实例*/
//MARK:16.对谓词的认识
    /*Cocoa 中提供了一个NSPredicate的类,该类主要用于指定过滤器的条件, 每一个对象通过谓词进行筛选,判断条件是否匹配。正则表达式*/
//MARK: 17.static、self、super关键字的作用
    /*1.函数体内static变量的作用范围为该函数体，该变量内存只被分配一次，因此其值在下次调用时候任然维持上次的值
     2.模块内的static全局变量可以被这一模块内所有函数访问，但不能被模块外的其他函数访问
     3.在类中的static成员变量属于整个类的独有，对类的所有对象只有一份拷贝
     4.self:当前消息的接受者
     5.super:向父类发送消息*/
//MARK: 18#include与#import的区别，#import 与@class 的区别
    /**
     #include 和#import其效果相同,都是查询类中定义的行为(方法);
     
     *
     #import不能引起交叉编译,确保头文件只会被导入一次；
     
     *
     @class 的表明,只定 义了类的名称,而具体类的行为是未知的,一般用于.h 文件；
     
     *
     @class 比#import 编译效率更高。
     
     *
     此外@class 和#import 的主要区别在于解决引用死锁的问题
     
*/
//MARK：19.@public、@protected、@private 它们的含义与作用
    /**
     @public:对象的实例变量的作用域在任意地方都可以被访问 ;
     
     *
     @protected:对象的实例变量作用域在本类和子类都可以被访问 ;
     
     *
     @private:实例变量的作用域只能在本类(自身)中访问 .
     
*/
    
//MARK: 20 解释 id 类型
    /*任意类型对象，程序运行时才决定对象的类型。*/
//MARK:21 switch 语句 if 语句区别与联系
    /*均表示条件的判断,switch语句表达式只能处理的是整型、字符型和枚举类型,而选择流程语句则没有这样的限制。但switch语句比选择流程控制语句效率更高。*/
//MARK:22isMemberOfClass 和 isKindOfClass 联系与区别
    /**
     联系：两者都能检测一个对象是否是某个类的成员
     
     *
     区别：isKindOfClass 不仅用来确定一个对象是否是一个类的成员,也可以用来确定一个对象是否派生自该类的类的成员 ,而isMemberOfClass 只能做到第一点。
     
     *
     举例：如 ClassA派 生 自NSObject 类 , ClassA *a = [ClassA alloc] init];,[a isKindOfClass:[NSObject class]] 可以检查出 a 是否是 NSObject派生类 的成员,但 isMemberOfClass 做不到。
     
*/
    
//MARK: 23 iOS 开发中数据持久性有哪几种?
    /*数据存储的核心都是写文件。
     
     *
     属性列表：只有NSString、NSArray、NSDictionary、NSData可writeToFile；存储依旧是plist文件。plist文件可以存储的7中数据类型：array、dictionary、string、bool、data、date、number。
     
     *
     对象序列化（对象归档）：对象序列化通过序列化的形式，键值关系存储到本地，转化成二进制流。通过runtime实现自动化归档/解档，请参考这个文章。实现NSCoding协议必须实现的两个方法：
     
     1.编码（对象序列化）：把不能直接存储到plist文件中得到数据，转化为二进制数据，NSData，可以存储到本地；
     
     2.解码（对象反序列化）：把二进制数据转化为本来的类型。
     
     *
*/
//MARK:24  中小大小的程序不能使用一下两个偏大的方式存储
    /**
     SQLite 数据库：大量有规律的数据使用数据库。
     
     *
     CoreData ：通过管理对象进行增、删、查、改操作的。它不是一个数据库，不仅可以使用SQLite数据库来保持数据，也可以使用其他的方式来存储数据。如：XML。
     
     CoreData的介绍：
     
     *
     CoreData是面向对象的API，CoreData是iOS中非常重要的一项技术，几乎在所有编写的程序中，CoreData都作为数据存储的基础。
     
     *
     CoreData是苹果官方提供的一套框架，用来解决与对象声明周期管理、对象关系管理和持久化等方面相关的问题。
     
     *
     大多数情况下，我们引用CoreData作为持久化数据的解决方案，并利用它作为持久化数据映射为内存对象。提供的是对象-关系映射功能，也就是说，CoreData可以将Objective-C对象转换成数据，保存到SQL中，然后将保存后的数据还原成OC对象。
     
     CoreData的特征：
     
     *
     通过CoreData管理应用程序的数据模型，可以极大程度减少需要编写的代码数量。
     
     *
     将对象数据存储在SQLite数据库已获得性能优化。
     
     *
     提供NSFetchResultsController类用于管理表视图的数据，即将Core Data的持久化存储在表视图中，并对这些数据进行管理：增删查改。
     
     *
     管理undo/redo操纵；
     
     *
     检查托管对象的属性值是否正确。
     Core Data的6成员对象
     
     *
     NSManageObject:被管理的数据记录Managed Object Model是描述应用程序的数据模型，这个模型包含实体（Entity）、特性（Property）、读取请求（Fetch Request）等。
     
     *
     NSManageObjectContext：管理对象上下文，持久性存储模型对象，参与数据对象进行各种操作的全过程，并监测数据对象的变化，以提供对undo/redo的支持及更新绑定到数据的UI。
     
     *
     NSPersistentStoreCoordinator:连接数据库的Persistent Store Coordinator相当于数据文件管理器，处理底层的对数据文件的读取和写入，一般我们与这个没有交集。
     
     *
     NSManagedObjectModel：被管理的数据模型、数据结构。
     
     *
     NSFetchRequest：数据请求；
     
     *
     NSEntityDescription：表格实体结构，还需知道.xcdatamodel文件编译后为.momd或者.mom文件。
     
     Core Data的功能
     
     *
     对于KVC和KVO完整且自动化的支持，除了为属性整合KVO和KVC访问方法外，还整合了适当的集合访问方法来处理多值关系；
     
     *
     自动验证属性（property）值；
     
     *
     支持跟踪修改和撤销操作；
     
     *
     关系维护，Core Data管理数据的关系传播，包括维护对象间的一致性；
     
     *
     在内存上和界面上分组、过滤、组织数据；
     
     *
     自动支持对象存储在外部数据仓库的功能；
     
     *
     创建复杂请求：无需动手写SQL语句，在获取请求（fetch request）中关联NSPredicate。NSPreadicate支持基本功能、相关子查询和其他高级的SQL特性。它支持正确的Unicode编码、区域感知查询、排序和正则表达式；
     
     *
     延迟操作：Core Data使用懒加载（lazy loading）方式减少内存负载，还支持部分实体化延迟加载和复制对象的数据共享机制；
     
     *
     合并策略：Core Data内置版本跟踪和乐观锁（optimistic locking）来支持多用户写入冲突的解决，其中，乐观锁就是对数据冲突进行检测，若冲突就返回冲突的信息；
     
     *
     数据迁移：Core Data的Schema Migration工具可以简化应对数据库结构变化的任务，在某些情况允许你执行高效率的数据库原地迁移工作；
     
     *
     可选择针对程序Controller层的集成，来支持UI的显示同步Core Data在IPhone OS之上，提供NSFetchedResultsController对象来做相关工作，在Mac OS X上我们用Cocoa提供的绑定（Binding）机制来完成的。
     

     
*/
    
//MARK:25 对象可以被copy的条件
    /*只有实现了NSCopying和NSMutableCopying两个协议的类的对象才能被拷贝
     */
//- (id)copyWithZone:(NSZone *)zone {
//        MyObject *copy = [[[self class] allocWithZone: zone] init];
//        copy.username = [self.username copyWithZone:zone];
//        return copy;
//    }
    
//MARK: 26自动释放池原理
    /*自动释放池是NSAutorelease类的一个实例，当向一个对象发送autorelease消息时候，该对象会自动进入池，待池销毁时候，会向池中所有对象发送一条release消息，释放对象
     2.【pool release】【pool drain】表示池子本身不销毁，而是池子冲的临时对象都被销毁*/
//MARK:27 在某个方法中 self.name = _name，name = _name 它 们有区别吗，为什么?
    /*前者是存在内存管理的setter方法赋值，他对_name对象进行保留或者进行拷贝操作
     2，后者是普通赋值
     3.一般来说，在对象的方法里成员变量和方法是可以访问的，我们通常会重写setter方法来执行额外的工作。比如说，外部传一个模型过来，那么我们直接重写setter方法，当模型传过来的时候，也就是意味着数据发生了变化，那么视图也需要更新显示，则在赋值新模型同时也去刷新UI*/
//MARK:28解释self = [super init]方法
    
   /*容错处理，当父类初始化失败，会返回一个nil，表示初始化失败。犹豫继承的关系，子类需要拥有父类的实例行为，因此，我们必须先初始化父类，然后再初始化子类*/
//MARK: 29定义属性时，什么时候用 assign、retain、copy 以及它们的之间的区别。
    /**
     assign:普通赋值,一般常用于基本数据类型,常见委托设计模式, 以此来防止循环引用。(我们称之为弱引用).现在都用weak
     
     *
     retain:保留计数,获得到了对象的所有权,引用计数在原有基础上加1.
     
     *
     copy:一般认为,是在内存中重新开辟了一个新的内存空间,用来 存储新的对象,和原来的对象是两个不同的地址,引用计数分别为1。但是当copy对象为不可变对象时,那么copy 的作用相当于retain。因为,这样可以节约内存空间*/
//MARK:30堆和栈的区别
    /*1.栈区，由编译器自动分配释放，存放方法的参数值，局部变量的值等，栈是向低地址扩展的数据结构，是一块连续的内存区域。栈顶的地址和栈的最大容量是系统预先预定好的
     2.堆区，一般程序员分配释放，若程序员不释放，程序结束时候由OS回收，向高地址扩展的数据结构，是不连续的内存区域，从而获得的空间相对灵活
     3.碎片问题：对于堆来说，频繁的new、delete必然会造成内存空间的不连续，从而造成大量的碎片，让程序效率降低，对于栈来说，则不能存在这个问题，因为栈是先进后出的队列，他们是以一对应的，所以不能有碎片
     4.分配方式：堆都是动态分配，没有静态的堆，栈有两种分配方式，动态和静态分配。静态分配是有编译器完成，不如局部变量的分配，动态分配是有Alloca函数来分配，但是栈的动态分配和堆是不同的，他的动态分配是有编译器进行释放的，无需我们手工实现
     5.分配效率：栈是机器系统提供的数据结构，计算机会在底层对栈进行提供支持，分配专门的寄存器存放栈的地址，压栈出栈都是有专门的指令执行，这就决定了栈的效率比较高。堆则是c/c++函数提供的，它的机制是很复杂的。
     6、全局区：全局变量和静态变量的存储是放在一起的，初始化的全局变量和静态变量实在一块区域，未来初始化的全局变量和未初始化的静态变量在相邻的另一块区域。程序结束后的由系统释放。
     7.文字常量区 常量字符串就是放在这里 程序结束后由系统释放
     
     8.程序代码区 存放函数体的二进制代码
     */
//MARK:31：UITableViewCell上有个UILabel，显示NSTimer实现的秒表时间，手指滚动cell过程中，label是否刷新，为什么？
    /*这是否刷新取决于timer加入到Run Loop中的Mode是什么。Mode主要是用来指定事件在运行循环中的优先级的，分为：
     
     *
     NSDefaultRunLoopMode（kCFRunLoopDefaultMode）：默认，空闲状态
     
     *
     UITrackingRunLoopMode：ScrollView滑动时会切换到该Mode
     
     *
     UIInitializationRunLoopMode：run loop启动时，会切换到该mode
     
     *
     NSRunLoopCommonModes（kCFRunLoopCommonModes）：Mode集合
     
     苹果公开提供的Mode有两个：
     
     *
     NSDefaultRunLoopMode（kCFRunLoopDefaultMode）
     
     *
     NSRunLoopCommonModes（kCFRunLoopCommonModes）
     
     *
     在编程中：如果我们把一个NSTimer对象以NSDefaultRunLoopMode（kCFRunLoopDefaultMode）添加到主运行循环中的时候, ScrollView滚动过程中会因为mode的切换，而导致NSTimer将不再被调度。当我们滚动的时候，也希望不调度，那就应该使用默认模式。但是，如果希望在滚动时，定时器也要回调，那就应该使用common mode。*/
//MARK:32对于单元格的重用的理解
    /**
     当屏幕上滑出屏幕时，系统会把这个单元格添加到重用队列中，等待被重用，当有新单元从屏幕外滑入屏幕内时，从重用队列中找看有没有可以重用的单元格，若有，就直接用，没有就重新创建一个。
     
*/
//MARK: 33 解决cell重用的问题
    /*一般cell没有问题，但是高度自定义的cell就会无法重用，因为每个cell都不同*/
//MARK: 34有a、b、c、d 4个异步请求，如何判断a、b、c、d都完成执行？如果需要a、b、c、d顺序执行，该如何实现？
    /*dispatch_group_notify 会在所有线程执行结束之后调用*/
    /*GCD 的串行队列可以顺序执行*/
//MARK: 35使用block有什么好处？使用NSTimer写出一个使用block显示（在UILabel上）秒表的代码。
    /*代码紧凑，传值，回调都很方便，省去了很多代码*/
    /*NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0
     repeats:YES
     callback:^() {
     weakSelf.secondsLabel.text = ...
     }
     [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];*/
//MARK:36一个view已经初始化完毕，view上面添加了n个button，除用view的tag之外，还可以采用什么办法来找到自己想要的button来修改button的值。
    /**
     第一种：如果是点击某个按钮后，才会刷新它的值，其它不用修改，那么不用引用任何按钮，直接在回调时，就已经将接收响应的按钮给传过来了，直接通过它修改即可。
     
     *
     第二种：点击某个按钮后，所有与之同类型的按钮都要修改值，那么可以通过在创建按钮时将按钮存入到数组中，在需要的时候遍历查找*/
//MARK:37线程与进程的区别和联系?
    /**
     一个程序至少要有进城,一个进程至少要有一个线程。
     
     *
     进程:资源分配的最小独立单元,进程是具有一定独立功能的程序关于某个数据集合上的一次运行活动,进程是系统进行资源分配和调度的一个独立单位。
     
     *
     线程:进程下的一个分支,是进程的实体,是CPU调度和分派的基本单元,它是比进程更小的能独立运行的基本单位,线程自己基本不拥有系统资源,只拥有一点在运行中必不可少的资源(程序计数器、一组寄存器、栈)，但是它可与同属一个进程的其他线程共享进程所拥有的全部资源。
     
     *
     进程和线程都是由操作系统所体会的程序运行的基本单元，系统利用该基本单元实现系统对应用的并发性。
     
     *
     进程和线程的主要差别在于它们是不同的操作系统资源管理方式。进程有独立的地址空间，一个进程崩溃后，在保护模式下不能对其它进程产生影响，而线程只是一个进程中的不同执行路径。线程有自己的堆栈和局部变量，但线程之间没有单独的地址空间，一个线程死掉就等于整个进程死掉，所以多进程的程序要比多线程的程序健壮，但在进程切换时，耗费资源较大，效率要差一些。
     
     *
     但对于一些要求同时进行并且又要共享某些变量的并发操作，只能用线程，不能用进程。*/
//MARK:38:多线程编程
    /**
     NSThread:当需要进行一些耗时操作时会把耗时的操作放到线程中。线程同步：多个线程同时访问一个数据会出问题，NSlock、线程同步块、@synchronized(self){}。
     
     *
     NSOperationQueue操作队列（不需考虑线程同步问题）。编程的重点都放在main里面，NSInvocationOperation、BSBlockOperation、自定义Operation。创建一个操作绑定相应的方法，当把操作添加到操作队列中时，操作绑定的方法就会自动执行了，当把操作添加到操作队列中时，默认会调用main方法。
     
     *
     GCD（`Grand Central Dispatch）宏大的中央调度，串行队列、并发队列、主线程队列；
     
     *
     同步和异步：同步指第一个任务不执行完，不能开始第二个，异步是不管第一个有没有执行完，都开始第二个。
     
     *
     串行和并行：串行是多个任务按一定顺序执行，并行是多个任务同时执行；
     
     *
     代码是在分线程执行，在主线程嘟列中刷新UI。
     
     多线程编程是防止主线程堵塞、增加运行效率的最佳方法。
     
     *
     Apple提供了NSOperation这个类，提供了一个优秀的多线程编程方法；
     
     *
     一个NSOperationQueue操作队列，相当于一个线程管理器，而非一个线程，因为你可以设置这个线程管理器内可以并行运行的线程数量等。
     
     *
     多线程是一个比较轻量级的方法来实现单个应用程序内多个代码执行路径。
     
     *
     iPhoneOS下的主线程的堆栈大小是1M。第二个线程开始就是512KB，并且该值不能通过编译器开关或线程API函数来更改，只有主线程有直接修改UI的能力。
     
*/
//MARK:39:定时器与线程的区别
    /**
     定时器;可以执行多次，默认在主线程中。
     
     *
     线程：只能执行一次。
     */
//MARK:40:TCP和UDP的区别于联系
    /**
     TCP为传输控制层协议，为面向连接、可靠的、点到点的通信；
     
     *
     UDP为用户数据报协议，非连接的不可靠的点到多点的通信；
     
     *
     TCP侧重可靠传输，UDP侧重快速传输*/
    
//MARK:41 TCP三次握手
    /*第一次握手 ： 客户端发送syn包 到服务器，并进入SYN_SEND状态，等待服务器确认；
     第二次握手：服务器收到syn包，必须确认客户的SYN，同时自己也发送一个SYN包，SYN+ACK包，此时服务器进入，SYN+RECV状态
     第三次握手：客户端收到服务器SYN+ACK包，向服务器发送确认包ACK,发送完毕后，客户端和服务器端进入ESTABLISHED状态，完成三次状态链接*/
//MARK:42.socket和Htttp连接的区别
    /*1.HTTP协议是基于TCP链接的，是应用层协议，主要解决如何包装数据。Socket是对于TCP/ip协议的封装，socket本身并不是协议，而是一个调用接口，通过socket,我们才能使用tcp/ip协议
     2.http链接。短连接，客户端向服务器发送一次请求，服务器相应后链接断开，节省资源。服务器不能主动给客户端相应，（NSURLConnection）
     3.Socket链接：长链接，客户端跟服务器直接使用socket进行链接，没有规定链接后断开，因此客户端和服务器保持链接通道，双方可以主动发送数据，一般多用于游戏，scoket默认链接超时时间是30秒，默认大小是8K(一个数据包大小)*/
//MARK: 43HTTP协议的特点，关于HTTP请求GET和POST的区别
    /*HTTP超文本传输协议，是短连接，是客户端主动发送请求，服务器做出响应，服务器响应之后，链接断开。HTTP是一个属于应用层面向对象的协议，HTTP有两类报文：请求报文和响应报文。
     *
     HTTP请求报文：一个HTTP请求报文由请求行、请求头部、空行和请求数据4部分组成。
     
     *
     HTTP响应报文：由三部分组成：状态行、消息报头、响应正文。
     
     *
     *
     *
     GET请求：参数在地址后拼接，没有请求数据，不安全（因为所有参数都拼接在地址后面），不适合传输大量数据（长度有限制，为1024个字节）。
     
     GET提交、请求的数据会附在URL之后，即把数据放置在HTTP协议头中。
     
     以？分割URL和传输数据，多个参数用&连接。如果数据是英文字母或数字，原样发送，
     
     如果是空格，转换为+，如果是中文/其他字符，则直接把字符串用BASE64加密。
     
     *
     POST请求：参数在请求数据区放着，相对GET请求更安全，并且数据大小没有限制。把提交的数据放置在HTTP包的包体中.
     
     *
     GET提交的数据会在地址栏显示出来，而POST提交，地址栏不能改变。
     
     传输数据的大小：
     
     *
     GET提交时，传输数据就会受到URL长度限制，POST由于不是通过URL传值，理论上书不受限。
     
     安全性：
     
     *
     POST的安全性要比GET的安全性高；
     
     *
     通过GET提交数据，用户名和密码将明文出现在URL上，比如登陆界面有可能被浏览器缓存。
     
     *
     HTTPS：安全超文本传输协议（Secure Hypertext Transfer Protocol），它是一个安全通信通道，基于HTTP开发，用于客户计算机和服务器之间交换信息，使用安全套结字层（SSI）进行信息交换，即HTTP的安全版。
     

*/
    
//MARK:44.ASIHttpRequest、AFNetWorking之间的区别
    /**
     ASIHttpRequest功能强大，主要是在MRC下实现的，是对系统CFNetwork API进行了封装，支持HTTP协议的CFHTTP，配置比较复杂，并且ASIHttpRequest框架默认不能帮你监听网络改变，如果需要让ASIHttpRequest帮你监听网络状态改变，并且手动开始这个功能。
     
     *
     AFNetWorking构建于NSURLConnection、NSOperation以及其他熟悉的Foundation技术之上。拥有良好的架构，丰富的API及模块构建方式，使用起来非常轻松。它基于NSOperation封装的，AFURLConnectionOperation子类。
     
     *
     ASIHttpRequest是直接操作对象ASIHttpRequest是一个实现了NSCoding协议的NSOperation子类；AFNetWorking直接操作对象的AFHttpClient，是一个实现NSCoding和NSCopying协议的NSObject子类。
     
     *
     同步请求：ASIHttpRequest直接通过调用一个startSynchronous方法；AFNetWorking默认没有封装同步请求，如果开发者需要使用同步请求，则需要重写getPath:paraments:success:failures方法，对于AFHttpRequestOperation进行同步处理。
     
     *
     性能对比：AFNetworking请求优于ASIHttpRequest；
     
*/
//MARK:45XML数据解析方式各有什么不同，JSON解析有哪些框架？
    /**
     XML数据解析的两种解析方式：DOM解析和SAX解析；
     
     *
     DOM解析必须完成DOM树的构造，在处理规模较大的XML文档时就很耗内存，占用资源较多，读入整个XML文档并构建一个驻留内存的树结构（节点树），通过遍历树结构可以检索任意XML节点，读取它的属性和值，通常情况下，可以借助XPath查询XML节点；
     
     *
     SAX与DOM不同，它是事件驱动模型，解析XML文档时每遇到一个开始或者结束标签、属性或者一条指令时，程序就产生一个事件进行相应的处理，一边读取XML文档一边处理，不必等整个文档加载完才采取措施，当在读取解析过程中遇到需要处理的对象，会发出通知进行处理。因此，SAX相对于DOM来说更适合操作大的XML文档。
     
     *
     JSON解析：性能比较好的主要是第三方的JSONKIT和iOS自带的JSON解析类，其中自带的JSON解析性能最高，但只能用于iOS5之后。
     
*/
//MARK:46:如何进行真机调试？
    /*1.首先需要用钥匙串创建一个钥匙（key）；
     
     2.将钥匙串上传到官网，获取iOS Development证书；
     
     3.创建App ID即我们应用程序中的Boundle ID；
     
     4.添加Device ID即UDID；
     
     5.通过勾选前面所创建的证书：App ID、Device ID；
     
     6.生成mobileprovision文件；
     
     7.先决条件：申请开发者账号 99美刀
     
*/
//MARK:47APP发布的上架流程
    /*1.登录应用发布网站添加应用信息；
     
     2.下载安装发布证书；
     
     3.选择发布证书，使用Archive编译发布包，用Xcode将代码（发布包）上传到服务器；
     
     4.等待审核通过;
     
     5.生成IPA：菜单栏->Product->Archive.
     
*/
//MARK:48SVN的使用
    /**
     SVN=版本控制+备份服务器，可以把SVN当成备份服务器，并且可以帮助你记住每次上服务器的档案内容，并自动赋予每次变更的版本；
     
     *
     SVN的版本控制：所有上传版本都会帮您记录下来，也有版本分支及合并等功能。SVN可以让不同的开发者存取同样的档案，并且利用SVN Server作为档案同步的机制，即您有档案更新时，无需将档案寄送给您的开发成员。SVN的存放档案方式是采用差异备份的方式，即会备份到不同的地方，节省硬盘空间，也可以对非文字文件进行差异备份。
     
     *
     SVN的重要性：备份工作档案的重要性、版本控管的重要性、伙伴间的数据同步的重要性、备份不同版本是很耗费硬盘空间的；
     
     *
     防止冲突：
     
     1.防止代码冲突：不要多人同时修改同一文件，例如：A、B都修改同一个文件，先让A修改，然后提交到服务器，然后B更新下来，再进行修改；
     
     2.服务器上的项目文件Xcodeproj，仅让一个人管理提交，其他人只更新，防止文件发生冲突。
     
*/
//MARK:49 如何进行网络消息推送
    /**
     一种是Apple自己提供的通知服务（APNS服务器）、一种是用第三方推送机制。
     
     *
     首先应用发送通知，系统弹出提示框询问用户是否允许，当用户允许后向苹果服务器(APNS)请求deviceToken，并由苹果服务器发送给自己的应用，自己的应用将DeviceToken发送自己的服务器，自己服务器想要发送网络推送时将deviceToken以及想要推送的信息发送给苹果服务器，苹果服务器将信息发送给应用。
     
     *
     推送信息内容，总容量不超过256个字节；
     
     *
     iOS SDK本身提供的APNS服务器推送，它可以直接推送给目标用户并根据您的方式弹出提示。
     
     优点：不论应用是否开启，都会发送到手机端；
     
     缺点：消息推送机制是苹果服务端控制，个别时候可能会有延迟，因为苹果服务器也有队列来处理所有的消息请求；
     
     *
     第三方推送机制，普遍使用Socket机制来实现，几乎可以达到即时的发送到目标用户手机端，适用于即时通讯类应用。
     
     优点：实时的，取决于心跳包的节奏；
     
     缺点：iOS系统的限制，应用不能长时间的后台运行，所以应用关闭的情况下这种推送机制不可用。*/
//MARK: : 网络七层协议 做一了解
    /**
     应用层：
     
     1.用户接口、应用程序；
     
     2.Application典型设备：网关；
     
     3.典型协议、标准和应用：TELNET、FTP、HTTP
     
     *
     表示层：
     
     1.数据表示、压缩和加密presentation
     
     2.典型设备：网关
     
     3.典型协议、标准和应用：ASCLL、PICT、TIFF、JPEG|MPEG
     
     4.表示层相当于一个东西的表示，表示的一些协议，比如图片、声音和视频MPEG。
     
     *
     会话层：
     
     1.会话的建立和结束；
     
     2.典型设备：网关；
     
     3.典型协议、标准和应用：RPC、SQL、NFS、X WINDOWS、ASP
     
     *
     传输层：
     
     1.主要功能：端到端控制Transport；
     
     2.典型设备：网关；
     
     3.典型协议、标准和应用：TCP、UDP、SPX
     
     *
     网络层：
     
     1.主要功能：路由、寻址Network；
     
     2.典型设备：路由器；
     
     3.典型协议、标准和应用：IP、IPX、APPLETALK、ICMP；
     
     *
     数据链路层：
     
     1.主要功能：保证无差错的疏忽链路的data link；
     
     2.典型设备：交换机、网桥、网卡；
     
     3.典型协议、标准和应用：802.2、802.3ATM、HDLC、FRAME RELAY；
     
     *
     物理层：
     
     1.主要功能：传输比特流Physical；
     
     2.典型设备：集线器、中继器
     
     3.典型协议、标准和应用：V.35、EIA/TIA-232.*/
//MARK: 50对NSUserDefaults的理解
    /*系统提供的一种存储数据的方式，主要用于保存少量的数据，默认存储到library的Preferences文件*/
//MARK: 51 SDWebImage原理
    /*1.从内存中找图片，找到直接使用
     2.从沙合中找，找到直接使用，并缓存到沙盒
     3.从网络上获取，使用，缓存到内存和沙盒*/
//MARK: 52 OC中是否有二维数组，如何实现二维数组？
    /*OC中没有二维数组，可以通过嵌套数组实现二维数组*/
//MARK: 53 LayoutSubViews在什么时候被调用？
    /*当View本身的frame改变时，会调用这个方法。*/
//MARK :54 深拷贝浅拷贝
    /*
     
     *
     浅复制：两个实例的指针仍指向内存中的同一资源，只复制指针值而不是实际资源；
     
     *
     深复制：不仅复制指针值，还复制指向指针所指向的资源。如下图：
     
*/

   
}
//MARK:55单例模式理解与使用
/**
 单例模式是一种常用设计模式，单例模式是一个类在系统中只有一个实例对象。通过全局的一个入口点对这个实例对象进行访问；
 
 *
 iOS中单例模式的实现方式一般分为两种：非ARC和ARC+GCD。*/

static UIView * instance;
+(UIView*)defaultInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance =[[UIView alloc]init];
    });
    return instance;
}

//MARK: 56对沙盒的理解
/**
 每个iOS应用都被限制在“沙盒”中，沙盒相当于一个加了仅主人可见权限的文件夹，及时在应用程序安装过程中，系统为每个单独的应用程序生成它的主目录和一些关键的子目录。苹果对沙盒有几条限制:
 
 1.应用程序在自己的沙盒中运作，但是不能访问任何其他应用程序的沙盒；
 
 2.应用之间不能共享数据，沙盒里的文件不能被复制到其他应用程序的文件夹中，也不能把其他应用文件夹复制到沙盒中；
 
 3.苹果禁止任何读写沙盒以外的文件，禁止应用程序将内容写到沙盒以外的文件夹中；
 
 4.沙盒目录里有三个文件夹：Documents——存储；应用程序的数据文件，存储用户数据或其他定期备份的信息；Library下有两个文件夹，Caches存储应用程序再次启动所需的信息，
 
 Preferences包含应用程序的偏好设置文件，不可在这更改偏好设置；temp存放临时文件即应用程序再次启动不需要的文件。
 
 *
 获取沙盒根目录的方法，有几种方法：用NSHomeDirectory获取。
 
 *
 获取Document路径：NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES).*/
//MARK:57ViewController 的 loadView、viewDidLoad、viewDidUnload 分别是在什么时候调用的？
/**
 viewDidLoad在view从nib文件初始化时调用，loadView在controller的view为nil时调用。
 
 *
 此方法在编程实现view时调用,view控制器默认会注册memory warning notification,当view controller的任何view没有用的时候，viewDidUnload会被调用，在这里实现将retain的view release,如果是retain的IBOutlet view 属性则不要在这里release,IBOutlet会负责release 。
 
*/
//MARK:58关键字volatile有什么含意?并给出三个不同的例子：
/*1.并行设备的硬件寄存器（如：状态寄存器）；
 
 2.一个中断服务子程序中会访问到的非自动变量(Non-automatic variables)；
 
 3.多线程应用中被几个任务共享的变量。
 
*/
//MARK:59 @synthesize、@dynamic的理解
/**
 @synthesize是系统自动生成getter和setter属性声明;@synthesize的意思是，除非开发人员已经做了，否则由编译器生成相应的代码，以满足属性声明；
 
 *
 @dynamic是开发者自已提供相应的属性声明,@dynamic意思是由开发人员提供相应的代码：对于只读属性需要提供setter，对于读写属性需要提供 setter 和getter。查阅了一些资料确定@dynamic的意思是告诉编译器,属性的获取与赋值方法由用户自己实现, 不自动生成。
 
*/
//MARK:60frame和bounds有什么不同？
/**
 frame指的是：该view在父view坐标系统中的位置和大小。（参照点是父亲的坐标系统）
 
 *
 bounds指的是：该view在本身坐标系统中的位置和大小。（参照点是本身坐标系统）
 
*/
//MARK:61view的touch事件有哪些？
/*- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
 - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
 - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
 - (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
*/
//MARK:62自定义实现UITabbarController的原理
/*运用字典，点击五个按钮的一个可以从字典里选择一个控制器对象，将其View显示到主控制器视图上。*/
//MARK:63iOS中的响应者链的工作原理
/*1.每一个应用都有一个响应者链，我们的视图结构是一个N叉树，而每一个继承UIResponder的对象都可以在这个N叉树种扮演一个节点。
 2.当叶节点成为最高响应者的时候，从这个叶节点开始往其父节点开始追溯出一条链，那么对于这一个叶节点来讲，这一条链就是当前的响应者链。响应者链将系统捕获到的UIEvent与UITouch从叶节点开始层层向下分发，期间可以选择停止分发，可以选择继续向下分发*/
//MARK:64View和View之间传值方式
/**
 对象的property属性传值；
 
 *
 方法参数传值；
 
 *
 NSUserDefault传值；
 
 *
 块传值。
 
*/
//MARK:65property属性的修饰符的作用
/**
 getter=getName、setter=setName：设置setter与getter的方法名；
 
 *
 readwrite、readonly：设置可供访问级别；
 
 *
 assign：方法直接赋值，不进行任何retain操作，为了解决原类型与环循引用问题；
 
 *
 retain：其setter方法对参数进行release旧值再retain新值，所有实现都是这个顺序；
 
 *
 copy：其setter方法进行copy操作，与retain处理流程一样，先对旧值release，再copy出新的对象，retainCount为1。这是为了减少对上下文的依赖而引入的机制。
 
 *
 nonatomic：非原子性访问，不加同步， 多线程并发访问会提高性能。注意，如果不加此属性，则默认是两个访问方法都为原子型事务访问。*/
//MARK:66对于Run Loop的理解
/**
 RunLoop，是多线程的法宝，即一个线程一次只能执行一个任务，执行完任务后就会退出线程。主线程执行完即时任务时会继续等待接收事件而不退出。非主线程通常来说就是为了执行某一任务的，执行完毕就需要归还资源，因此默认是不运行RunLoop的；
 
 *
 每一个线程都有其对应的RunLoop，只是默认只有主线程的RunLoop是启动的，其它子线程的RunLoop默认是不启动的，若要启动则需要手动启动；
 
 *
 在一个单独的线程中，如果需要在处理完某个任务后不退出，继续等待接收事件，则需要启用RunLoop；
 
 *
 NSRunLoop提供了一个添加NSTimer的方法，可以指定Mode，如果要让任何情况下都回调，则需要设置Mode为Common模式；
 
 *
 实质上，对于子线程的runloop默认是不存在的，因为苹果采用了懒加载的方式。如果我们没有手动调用[NSRunLoop currentRunLoop]的话，就不能去查询是否存在当前线程的RunLoop，也就不能去加载，更不能创建。*/
//MARK:67 SQLite中常用的SQL语句
/**
 创建表：creat table 表名 (字段名 字段数据类型 是否为主键, 字段名 字段数据类型, 字段名 字段数据类型...)；
 
 *
 增: insert into 表名 (字段1, 字段2...) values (值1, 值2...)；
 
 *
 删: delete from 表名 where 字段 = 值；*/
//MARK:68:队列和多线程的使用原理
/*在iOS中队列分为以下几种：
 
 *
 串行队列：队列中的任务只会顺序执行；
 
 1
 dispatch_queue_t q = dispatch_queue_create("...", DISPATCH_QUEUE_SERIAL);
 *
 并行队列： 队列中的任务通常会并发执行；
 
 1
 dispatch_queue_t q = dispatch_queue_create("......",DISPATCH_QUEUE_CONCURRENT);
 *
 全局队列：是系统的，直接拿过来（GET）用就可以；与并行队列类似；
 
 1
 dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 *
 主队列：每一个应用程序对应唯一主队列，直接GET即可；在多线程开发中，使用主队列更新UI；
 
 1
 dispatch_queue_t q = dispatch_get_main_queue();
*/
//MARK:69:内存的使用和优化的注意事项
/**
 重用问题：如UITableViewCells、UICollectionViewCells、UITableViewHeaderFooterViews设置正确的reuseIdentifier，充分重用；
 
 *
 尽量把views设置为不透明：当opque为NO的时候，图层的半透明取决于图片和其本身合成的图层为结果，可提高性能；
 
 *
 不要使用太复杂的XIB/Storyboard：载入时就会将XIB/storyboard需要的所有资源，包括图片全部载入内存，即使未来很久才会使用。那些相比纯代码写的延迟加载，性能及内存就差了很多；
 
 *
 选择正确的数据结构：学会选择对业务场景最合适的数组结构是写出高效代码的基础。比如，数组: 有序的一组值。使用索引来查询很快，使用值查询很慢，插入/删除很慢。字典: 存储键值对，用键来查找比较快。集合: 无序的一组值，用值来查找很快，插入/删除很快。
 
 *
 gzip/zip压缩：当从服务端下载相关附件时，可以通过gzip/zip压缩后再下载，使得内存更小，下载速度也更快。
 
 *
 延迟加载：对于不应该使用的数据，使用延迟加载方式。对于不需要马上显示的视图，使用延迟加载方式。比如，网络请求失败时显示的提示界面，可能一直都不能使用到，因此应该使用延迟加载。
 
 *
 数据缓存：对于cell的行高要缓存起来，使得reload数据时，效率也极高。而对于那些网络数据，不需要每次都请求的，应该缓存起来，可以写入数据库，也可以通过plist文件存储。
 
 *
 处理内存警告：一般在基类统一处理内存警告，将相关不用资源立即释放掉
 
 *
 重用大开销对象：一些objects的初始化很慢，比如NSDateFormatter和NSCalendar，但又不可避免地需要使用它们。通常是作为属性存储起来，防止反复创建。
 
 *
 避免反复处理数据：许多应用需要从服务器加载功能所需的常为JSON或者XML格式的数据。在服务器端和客户端使用相同的数据结构很重要;
 
 *
 使用Autorelease Pool：在某些循环创建临时变量处理数据时，自动释放池以保证能及时释放内存;*/
//MARK:70UIImageView添加圆角
/*最直接的方法就是使用如下属性设置：
 imgView.layer.cornerRadius = 10;
 // 这一行代码是很消耗性能的
 imgView.clipsToBounds = YES;
 **这是离屏渲染（off-screen-rendering），消耗性能的**
 
 *
 给UIImage添加生成圆角图片的扩展API：这是on-screen-rendering*/

//- (UIImage *)imageWithCornerRadius:(CGFloat)radius {
//    CGRect rect = (CGRect){0.f, 0.f, self.size};
//    
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
//    CGContextAddPath(UIGraphicsGetCurrentContext(),
//                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
//    CGContextClip(UIGraphicsGetCurrentContext());
//    
//    [self drawInRect:rect];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return image;
//}
//MARK:day10-1 NSstring类的实现
+(id)initWithCString:(const char*)CString encoding:(NSStringEncoding)encoding{
    NSString * obj;
    obj = [self allocWithZone:NSDefaultMallocZone()];
    obj = [obj initWithCString:CString encoding:encoding];
    
    return obj;
    
}

//MARK:day10-2 sprintf,strcpy,memcpy使用上有什么要注意的地方
/*1. strcpy是一个字符串拷贝的函数，它的函数原型为strcpy(char *dst, const char *src);
 将src开始的一段字符串拷贝到dst开始的内存中去，结束的标志符号为'\0'，由于拷贝的长度不是由我们自己控制的，所以这个字符串拷贝很容易出错。
 2. 具备字符串拷贝功能的函数有memcpy，这是一个内存拷贝函数，它的函数原型为memcpy(char *dst, const char* src, unsigned int len); 将长度为len的一段内存，从src拷贝到dst中去，这个函数的长度可控。但是会有内存叠加的问题。
 3. sprintf是格式化函数。将一段数据通过特定的格式，格式化到一个字符串缓冲区中去。sprintf格式化的函数的长度不可控，有可能格式化后的字符串会超出缓冲区的大小，造成溢出。
*/
//MARK:day10-3 指针的鬼
-(void)zhizhen{
//    int a; //常数a
//    int *b; //指向b的指针
//    int **c;//指向一个指向c的指针的指针
//    int d[10];//数组
//    int *e[10];//一个数组存着10个指向常数的指针
//    int (*f)[10];//一个指针指向具有10个常数的数组
//    int (*g)(int);//指针指向一个函数，这个函数参数是int类型，和返回值也是int类型
//    int(*h[10])(int);//一个具有10个指针的数组指向一个函数，这个函数具有int参数和int返回值；
//   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
