import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';




// TODO: анимация переноса в карзи ну покупок


void main() {
  runApp(const MaterialApp(home: PhysicsCardDragDemo()));
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DraggableCard(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}

/// A draggable card that moves back to [Alignment.center] when it's
/// released.
class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  Alignment _dragAlignment = Alignment.center;

  late Animation<Alignment> _animation;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}




////////////////////////////////////////////////////////////////////////////////////////////////////////////











// void main() {
//   runApp(
//     MaterialApp(
//       home: const ExampleDragAndDrop(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

final List<Item> _items = const [
  Item(
    name: 'Spinach Pizza',
    totalPriceCents: 1299,
    uid: '1',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
  ),
  Item(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    uid: '2',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    uid: '3',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
];

@immutable
class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({Key? key}) : super(key: key);

  @override
  _ExampleDragAndDropState createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
    with TickerProviderStateMixin {
  final List<Customer> _people = [
    Customer(
      name: 'Makayla',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
    ),
    Customer(
      name: 'Nathan',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
    ),
    Customer(
      name: 'Emilio',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFF64209)),
      title: Text(
        'Order Food',
        style: Theme.of(context).textTheme.headline4?.copyWith(
              fontSize: 36,
              color: const Color(0xFFF64209),
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 0,
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _buildMenuList(),
              ),
              _buildPeopleRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12.0,
        );
      },
      itemBuilder: (context, index) {
        final item = _items[index];
        return _buildMenuItem(
          item: item,
        );
      },
    );
  }

  Widget _buildMenuItem({
    required Item item,
  }) {
    return LongPressDraggable<Item>(
      data: item,
      dragAnchor: DragAnchor.pointer,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        photoProvider: item.imageProvider,
      ),
      child: MenuListItem(
        name: item.name,
        price: item.formattedTotalItemPrice,
        photoProvider: item.imageProvider,
      ),
    );
  }

  Widget _buildPeopleRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 20.0,
      ),
      child: Row(
        children: _people.map(_buildPersonWithDropZone).toList(),
      ),
    );
  }

  Widget _buildPersonWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
        ),
        child: DragTarget<Item>(
          builder: (context, candidateItems, rejectedItems) {
            return CustomerCart(
              hasItems: customer.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              customer: customer,
            );
          },
          onAccept: (item) {
            _itemDroppedOnCustomerCart(
              item: item,
              customer: customer,
            );
          },
        ),
      ),
    );
  }
}

class CustomerCart extends StatelessWidget {
  const CustomerCart({
    Key? key,
    required this.customer,
    this.highlighted = false,
    this.hasItems = false,
  }) : super(key: key);

  final Customer customer;
  final bool highlighted;
  final bool hasItems;

  @override
  Widget build(BuildContext context) {
    final textColor = highlighted ? Colors.white : Colors.black;

    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted ? 8.0 : 4.0,
        borderRadius: BorderRadius.circular(22.0),
        color: highlighted ? const Color(0xFFF64209) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Image(
                    image: customer.imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 8.0),
              Text(
                customer.name,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: textColor,
                      fontWeight:
                          hasItems ? FontWeight.normal : FontWeight.bold,
                    ),
              ),
              Visibility(
                visible: hasItems,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Column(
                  children: [
                    const SizedBox(height: 4.0),
                    Text(
                      customer.formattedTotalItemPrice,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: textColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: textColor,
                            fontSize: 12.0,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    Key? key,
    this.name = '',
    this.price = '',
    required this.photoProvider,
    this.isDepressed = false,
  }) : super(key: key);

  final String name;
  final String price;
  final ImageProvider photoProvider;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 115 : 120,
                    width: isDepressed ? 115 : 120,
                    child: Image(
                      image: photoProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.photoProvider,
  }) : super(key: key);

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white,
        type: MaterialType.circle,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check,
                size: 74.0,
                color: Color(0xFF0E985E),
              ),
              Text(
                'All set!',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: const Color(0xFF0E985E),
                      fontSize: 48,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class Item {
  const Item({
    required this.totalPriceCents,
    required this.name,
    required this.uid,
    required this.imageProvider,
  });
  final int totalPriceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;
  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}

class Customer {
  Customer({
    required this.name,
    required this.imageProvider,
    List<Item>? items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<Item> items;

  String get formattedTotalItemPrice {
    final totalPriceCents =
        items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}