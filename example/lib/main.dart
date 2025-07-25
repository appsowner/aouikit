import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aouikit/aouikit.dart';
import './config/design/design.dart';

void main() {
  runApp(const MyExampleApp());
}

class MyExampleApp extends StatelessWidget {
  const MyExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandAppTheme(
      child: MaterialApp(
        title: 'AoUiKit Example',
        theme: ThemeData(
          colorScheme: appThemeData.colors.toColorScheme(Brightness.light),
          useMaterial3: true,
        ),
        home: const ExampleHomePage(),
      ),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    int selectedIndex = -1;
    bool isSelected = false;
    final List<AoUiSelectionCardStyle> cardStyles = [
      AoUiSelectionCardStyle(
        title: 'Opción 1',
        description: ['Detalle 1', 'Detalle 2'],
        footer: 'Pie de página 1',
      ),
      AoUiSelectionCardStyle(
        title: 'Opción 2',
        description: ['Detalle A', 'Detalle B'],
        footer: 'Pie de página 2',
      ),
      AoUiSelectionCardStyle(title: 'Opción 3', footer: 'Pie de página 3'),
    ];
    var _value;
    return Scaffold(
      appBar: AppBar(
        title: Text('AOUiKit Example', style: theme.typography.titleLarge),
        backgroundColor: theme.colors.primary,
        foregroundColor: theme.colors.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(theme.spacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Colores personalizados', style: theme.typography.titleMedium),
            SizedBox(height: theme.spacing.m),
            Row(
              children: [
                Container(width: 40, height: 40, color: theme.colors.primary),
                SizedBox(width: theme.spacing.s),
                Container(width: 40, height: 40, color: theme.colors.secondary),
                SizedBox(width: theme.spacing.s),
                Container(width: 40, height: 40, color: theme.colors.tertiary),
              ],
            ),
            SizedBox(height: theme.spacing.l),
            Text(
              'Tipografía personalizada',
              style: theme.typography.titleMedium,
            ),
            SizedBox(height: theme.spacing.s),
            Text('Body Small', style: theme.typography.bodySmall),
            Text('Body Medium', style: theme.typography.bodyMedium),
            Text('Body Large', style: theme.typography.bodyLarge),
            Text('Title Medium', style: theme.typography.titleMedium),
            Text('Title Large', style: theme.typography.titleLarge),
            Text('Headline Small', style: theme.typography.headlineSmall),
            Text('Headline Medium', style: theme.typography.headlineMedium),
            SizedBox(height: theme.spacing.l),
            Text('Botones personalizados', style: theme.typography.titleMedium),
            SizedBox(height: theme.spacing.m),
            SizedBox(height: theme.spacing.s),
            ElevatedButton(
              style: theme.buttonStyles.primary.toButtonStyle(
                theme.shapes.buttonShape,
              ),
              onPressed: () {},
              child: const Text('Botón Primario'),
            ),
            SizedBox(height: theme.spacing.s),
            OutlinedButton(
              style: theme.buttonStyles.outlined.toButtonStyle(
                theme.shapes.buttonShape,
              ),
              onPressed: () {},
              child: const Text('Botón Outlined'),
            ),
            SizedBox(height: theme.spacing.s),
            TextButton(
              style: theme.buttonStyles.ghost.toButtonStyle(
                theme.shapes.buttonShape,
              ),
              onPressed: () {},
              child: const Text('Botón Ghost'),
            ),
            SizedBox(height: theme.spacing.s),
            ElevatedButton(
              style: theme.buttonStyles.danger.toButtonStyle(
                theme.shapes.buttonShape,
              ),
              onPressed: () {},
              child: const Text('Botón Danger'),
            ),
            AOUIAccordion(
              title: 'Accordion Title',
              subtitle: 'Accordion Subtitle',
            ),
            AOUIAppTopBar(
              items: [
                AoAppBarItem(
                  iconData: Icons.home,
                  label: "Home",
                  tooltip: "Home",
                ),
                AoAppBarItem(
                  iconData: Icons.search,
                  label: "Search",
                  tooltip: "Search",
                ),
                AoAppBarItem(
                  iconData: Icons.person,
                  label: "Profile",
                  tooltip: "Profile",
                ),
              ],
              onTap: (index) {
                print("TUIAppTopBar: $index");
              },
              currentIndex: 0,
            ),
            AOUIAnchor(
              title: 'Anchor',
              onPressed: () {
                print('Anchor pressed');
              },
            ),
            AOUIAoAvatar(
              avatarSize: AOUIAoAvatarSize.xs,
              avatarContent: AOUIAoAvatarContent(
                type: AOUIAoAvatarContentType.image,
                image: AoUIImage(imageUrl: 'https://picsum.photos/200/300'),
              ),
              isBadged: true,
            ),
            AOUIBadge(badgeSize: AOUIBadgeSize.l, content: '1'),
            AoUiButton(
              type: AOUIButtonType.primary,
              size: AOUIButtonSize.l,
              label: 'Primary',
              onPressed: () {},
            ),
            AoUiButton(
              type: AOUIButtonType.secondary,
              size: AOUIButtonSize.xs,
              label: 'Secondary',
              onPressed: () {},
            ),
            AoCheckBox(
              state: AOUICheckBoxState.unchecked,
              onChanged: (AOUICheckBoxState state) {
                print(state);
              },
            ),
            AoUIImage(
              imageUrl: 'https://picsum.photos/100/100',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            AoUiCheckBoxRow(
              title: "Testing row 1",
              state: AoUiCheckBoxRowState.unchecked,
              onChanged: (AoUiCheckBoxRowState state) {
                print(state);
              },
            ),
            AoUiCheckBoxRow(
              title: "Testing row 2",
              state: AoUiCheckBoxRowState.unchecked,
              onChanged: (AoUiCheckBoxRowState state) {
                print(state);
              },
            ),
            AoUiChip(
              title: "Chip 1",
              size: AoUiChipSize.m,
              highlighted: false,
              leftIcon: Icons.attach_file,
              badgeValue: "1",
              rightIcon: Icons.close_fullscreen_rounded,
              onRightIconTap: () {
                print("Right icon tapped");
              },
            ),
            AoUiIconButton(
              type: AoUiIconButtonType.primary,
              size: AoUiIconButtonSize.m,
              iconData: Icons.add,
              onPressed: () {},
            ),
            AoUiIconButton(
              type: AoUiIconButtonType.primary,
              size: AoUiIconButtonSize.m,
              iconData: Icons.access_alarm_outlined,
              onPressed: () {},
            ),
            AoUiInputField(
              hintText: 'Hint Text',
              labelText: 'Label',
              obscureText: true,
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onChanged: (value) {},
              onEditingComplete: () {},
              onSubmitted: (value) {},
            ),
            AoUiMediaThumbnail(
              onPressed: () {
                print('Miniatura pulsada');
              },
              isSelectable: true,
              size: AoUiMediaThumbnailSize.large,
              mediaType: AoUiMediaThumbnailType.photo,
              customThumbnailImage: AoUIImage(
                imageUrl: 'https://picsum.photos/100/100',
              ),
            ),
            AoUiMenuItem(
              item: AoUiMenuItemProperties(
                title: 'Item 1',
                style: AoUiMenuItemStyle.both,
              ),
              action: (state) {
                print(state);
              },
            ),

            AoUiMobileButtonBlock(
              style: AoUiMobileButtonBlockStyle(
                style: AoUiMobileButtonBlockStyleType.flexible,
                left: AoUiButton(
                  label: 'Cancelar',
                  onPressed: () {},
                  type: AOUIButtonType.primary,
                ),
                right: AoUiButton(
                  label: 'Guardar',
                  onPressed: () {},
                  type: AOUIButtonType.secondary,
                ),
              ),
            ),

            // AoUiMobileOverlayHeader(
            //   style: AoUiOverlayMobileStyle(
            //     title: "Title",
            //     action: () {
            //       print("Action");
            //     },
            //     style: AoUiOverlayMobileStyleType.onlyTitle,
            //   ),
            // ),
            AoUiNavigationRow(
              title: "Fila de Navegación",
              icon: CupertinoIcons.person,
              accessoryView: CupertinoButton(
                child: Text("Botón"),
                onPressed: () {
                  print("Botón pulsado");
                },
              ),
            ),
            AoUiRadioButton(
              onPressed: (selected) {
                print('Botón presionado: $selected');
              },
              isSelected: true,
            ),
            AoUiRadioRow(
              title: 'Opción 1',
              description: 'Descripción opcional para la opción 1',
              isSelected: isSelected,
              onPressed: (selected) {
                setState(() {
                  isSelected = selected;
                });
              },
              backgroundDark: false, // Cambia a true para fondo oscuro
            ),
            // AoUiSearchBar(
            //   showBackIcon: true,
            //   showClearButton: true,
            //   placeholder: "Buscar",
            //   onBackAction: () {
            //     print("Botón atrás presionado");
            //   },
            //   onClear: () {
            //     print("Botón limpiar presionado");
            //   },
            //   onChanged: (value) {
            //     print("Valor búsqueda: $value");
            //   },
            //   autofocus: true,
            // ),
            // ListView.builder(
            //   padding: const EdgeInsets.all(16.0),
            //   itemCount: cardStyles.length,
            //   itemBuilder: (context, index) {
            //     final style = cardStyles[index];
            //     return Padding(
            //       padding: const EdgeInsets.only(bottom: 12.0),
            //       child: AoUiSelectionCard(
            //         style: style,
            //         isSelected: selectedIndex == index,
            //         showChevron: true,
            //         icon: Icons.account_circle,
            //         badgeCount: index == 1 ? 3 : null,
            //         badgeColor: Colors.red,
            //         isHovered: false, // Puedes manejar hover si quieres
            //         action: () {
            //           setState(() {
            //             selectedIndex = index;
            //           });
            //         },
            //       ),
            //     );
            //   },
            // ),
            // AoUiSlider(
            //   value: _value,
            //   min: 0.0,
            //   max: 100.0,
            //   onChanged: (newValue) {
            //     setState(() {
            //       _value = newValue;
            //     });
            //   },
            // ),
            // AoUiSnackBar(
            //   context: context,
            //   type: AoUiSnackBarType.success,
            //   message: 'Mensaje de éxito',
            //   action: AoUiSnackBarAction(
            //     label: 'Cerrar',
            //     onActionPressed: () {
            //       ScaffoldMessenger.of(
            //         context,
            //       ).hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
            //     },
            //   ),
            // ),
            AoUiSuccessCheckMark(),
            AoUiTag(
              tagContrast: AoUiTagContrast.high,
              tagIconType: AoUiTagIconType.left,
              tagSize: AoUiTagSize.s,
              tagText: 'Tag',
            ),
            AoUiToggleRow(
              title: 'Title',
              description: 'Description',
              icon: Icon(Icons.ac_unit),
              value: true,
              onChanged: (value) {
                print(value);
              },
            ),

            // AoUiToggleSwitch(
            //   value: _value,
            //   onChanged: (value) {
            //     setState(() {
            //       _value = value;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
