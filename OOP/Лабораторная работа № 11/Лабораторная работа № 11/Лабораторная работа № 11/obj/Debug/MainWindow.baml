   M S B A M L   `   `   `  ����g  cЛабораторная работа № 11, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullg8clr-namespace:Лабораторная_работа___11*Лабораторная_работа___11  5   	   {Bclr-namespace:Лабораторная_работа___11.ViewModel4Лабораторная_работа___11.ViewModel  6>   ;    5Лабораторная_работа___11.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Jlocal8clr-namespace:Лабораторная_работа___11     5   	   QvmBclr-namespace:Лабораторная_работа___11.ViewModel     6>     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � DataContext 5	      H   BЛабораторная_работа___11.ViewModel.MainViewModel  5
   
   .��5      �  � UseLayoutRounding .  
����� �.+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$
 shop��5      $
��Left=�6!   $	��374��5      
����� �
�������   
IsReadOnly .    AutoGenerateColumns .  $��14(�5   /      CanUserAddRows .  ��5   <   �� *Shops+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 
НОМЕР��6%   	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 64   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 6>   �� *
ID_PRODUCT+  5      $ НАЗВАНИЕ��6%   $	 * 67   
 6A   �� *NAME_PRODUCT+  5      $ ЦЕНА��6%   $	 * 63   
 6=   �� *PRICE_PRODUCT+5      �� 5   
   -   5         ��Name$ 	addButton��5      $	��ADD��6$   $
��Left=�62   $��65��6M   $��
501,10,0,0q�5      $	��Top=�6%   $	��172��6=   
���   ����	#FFC8E3B2$��18(�5   (   $
��Bold"�66   ���	#FF505050��5      �� *AddToBasketCommand+��68   �� *SelectedItem+ �� ElementName$
 shop��  5   
   -   5        $ basket��5      $
��Left=�6#   $	��426��5      ���	#FFBECFA5
������� .  .  $��14(�5   )    .  $��374,217,0,-1q�6N   ��5   >   �� *Basket+ 5        5      $ 
НОМЕР��6%   $	 * 64   
 6>   �� *
ID_PRODUCT+  5       $ НАЗВАНИЕ��6%   $	 * 67   
 6A   �� *NAME_PRODUCT+  5!      $ ЦЕНА��6%   $	 * 63   
 6=   �� *PRICE_PRODUCT+5$      �� 5%   
   -   5        $ removeButton��5%      $��REMOVE��6'   $
��Left=�68   $��65��6S   $��
501,98,0,0q�5&      $	��Top=�6!   $	��172��69   
���   ����	#FFC8E3B2$��18(�5'   $   $
��Bold"�62   ���	#FF505050��5(      �� *RemoveFromBasketCommand+��69   �� *SelectedItem+$ basket��5*      5+      