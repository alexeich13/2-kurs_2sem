   M S B A M L   `   `   `  ����C  ?Laba_6_7, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:Laba_6_7Laba_6_7  5   	   #clr-namespace:Laba_6_7Laba_6_7  5   	       Laba_6_7.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:Laba_6_7     5   	   %ucclr-namespace:Laba_6_7     5   	   _ [MaterialDesignThemes.Wpf, Version=4.4.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	     � Title$
  SHOP��5
   	    � Cursor$ Cross��6   $	��552��6%   $	��800��62   $	��450��6>   $	��800��6N    � Icon$; 5C:\BSTU\2 kurs\lab6-7\Resources\icons8-wpforms-96.png��6]   .��5      �    DefaultGrid#���   6   $��0,0,0,-6q�61    � ColumnDefinitions 5   
   �� 5      $	��13* �6   �� 5      $	��22* �6   �� 5      $	��15* �6    � RowDefinitions 5   
   �� 5      $	��59* �6   �� 5      $
��351* �6   �� 5      $
��119* �6   .+�5   
   ]� .+�5      o� $	��Top=�6   $��25��6(   $	��Top=�64   .@�5      m�   dic_Menu#���  6   $��25��6?   $��Segoe UI)�6K   .@�5      m� -   5        $��Русский��5      60   m� 5      -   5        $��Английский��5      63   m� 5      -   5          dic_SwitchTheme1#���  5      6K   m� 5      -   5          dic_SwitchTheme2#���  5      6K   5      5      5      � 5    
   $��1��6   .+�5!      ��   DefaultLabel#���  6   $��1��6;     
dic_Header#���  6K   $��Center=�6r   $��Center=�6�   $��20(�6�   $��Segoe UI)�6�   5"      � 5#   
   $��2��6   .+�5$      �� -   5         ��Name$ 	checkBox1��5$       d� 	IsChecked$ FalseY�6*   $��20��6<   $0��*Сменить цвет заголовка��6H   5%      � 5&   
   $��1��6   $��Center=�6   $��Center=�69   $	��338��6T   $	��160��6a    5'      �� 5(      �� 5)      �� 5*      �� 5+      �� 5,      �� 5-      .+�5/      �� -   5         ��Name$ 
AddProduct��5/   =     DefaultButton#���  6     dic_AddProduct#���  6Q   $��0��6|   $��Center=�6�   $��Center=�6�   $
 Hand��6�   6�   �� 50      -   5        $ ChangeProduct��50   =   #���  6     dic_ChangeProduct#���  6T   $��1��6�   $��Center=�6�   $��Center=�6�   6�   �� 51      -   5        $ SearchProduct��51   =   #���  6    	 dic_SearchProduct#��� 	 6T   $��2��6�   $��Center=�6�   $��Center=�6�   6�   �� 52      -	   5        $
 Sort��52   =   #���  6    
 dic_Sort#��� 
 6K   $��3��6p   $��Center=�6}   $��Center=�6�   $
 Hand��6�   6�   �� 53      -
   5        $ DeleteProduct��53   =   #���  6     dic_DeleteProduct#���  6T   $��4��6�   $��Center=�6�   $��Center=�6�   6�   �� 54      -   5        $ ClearFields��54   =   #���  6     dic_ClearField#���  6R   $��5��6}   $��Center=�6�   $��Center=�6�   $
 Hand��6�   6�   55      � 56   
   $��1��6   $��1��6   $��Center=�6,   $��Center=�6I   $	��338��6d   $	��400��6q    57      �� 58      $��2* �6#   �� 59      $��1* �6#    5;      �� 5<      $��2* �6    �� 5=      $��1* �6    .+�5?      �� 
���   �$	��320��6)   $	��392��66   $��1q�6B    �� CornerRadius$ 20��6V   $��2��6h   $��2��6y   �� 5@      -   5        	 ��Name$	 	infoImage��5@      $	��200��6I   $	��200��6V   ��6'   �� 
 �� Path$
 	photoPath�6V   �� 5A      $��1��6   $��25��6$   $��40��60     dic_ProductsName#���  6;   $��0,47,93,153q�6h   �� 5B      -   5         ��Name$ infoName��5B   >     DefaultText#���  6   $��1��6P   $��20��6`   $
��Wrap=�6l   $��	Qwrqwrqwr��6�   $��57,49,0,156q�6�   �� 5C      $��1��6   $��25��6$   $��40��60     dic_ProductsPrice#���  6;   $��0,79,93,121q�6i   �� 5D      -   5        $ 	infoPrice��5D   >   #���  6   $��1��6Q   $��20��6a   $
��Wrap=�6m   $��	Qwrqwrqwr��6�   $��57,82,0,123q�6�   �� 5E      $��1��6   $��25��6$   $��40��60     dic_ProductsTypeOfProduct#���  6;   $��0,114,93,86q�6q   �� 5F      -   5        $ infoTypeOfProduct��5F   >   #���  6   $��1��6Y   $
��Wrap=�6i   $��	Qwrqwrqwr��6}   $��57,117,22,86q�6�   �� 5G      $��1��6   $��25��6$     dic_ProductsRating#���  60   $��0,142,76,58q�6_   �� 5H      -   5        $ 
infoRating��5H   >   #���  6   $��1��6R   $��20��6b   $
��Wrap=�6n   $��	Qwrqwrqwr��6�   $��57,146,0,59q�6�   �� 5I      $��25��6     dic_ProductsDescription#���  6    $��21,225,176,88q�6T   $��2��6k   �� 5J      -   5        $ infoDescription��5J   ?   #���  6   $��1��6X   $
��Wrap=�6e   $K��EQwrqwrqwrwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww��6y   $��2��6�   $��
23,25,22,5q�6�   5K      � 5L   
   $��2��6   $��0,59,0,0q�6   $��2��61   .+�5M      �� -   5         ��Name$ listOfProducts��5M      $��2��6/   $��1��6?   ��5N      �� 5O      .R�5P      �  5Q      �� 5R   "   $��70 �63   �� 5S   "   $��70 �63   .+�5U      �� #���  6(   $��0��6d   $
��Left=�6t   ��6N   �� *Name+6�   �� 5V      #���  6(   $��1��6e   $��Right=�6u   ��6N   �� *Price+6�   5W      5X      5Z      5[      � 5\   
   $��2��6   $��0��6   $��0,19,0,0q�6,   .+�5]         Laba_6_7.Box  $��Center=�6   $	��Top=�65   $��48��6M   $	��240��6Y      Laba_6_7.UserTBox  5^      $��Center=�6   $	��Top=�6:   $��66��6R   $	��198��6^   $��0,27,0,0q�6j   5_      � 5`   
   $��1��6   $��1��6   $��
0,360,0,19q�6,   $��2��6@   .+�5a      �� $
��Left=�6   $��60��64   $��60��6@   
�������.+�5b      �� -   5        $��Center=�5b      $��52��66   $��50��6B   
�������$��0 4 0 0q�6�   .��5c      �� -   5        $��40��5c       $��40��6+   
������6I   5d      5e      �� 5g      -   5        $
��Left=�5g      $��70��60   $��70��6<   $��70 0 0 0q�6G   
�������.��5h      �� -   5        $��60��5h      $��60��6%   $��Center=�60   $��Center=�6K   
�������.��5i      �� -   5        $��45��5i      $��45��6(   
������6L   5j      5k      �� 5m      -   5        $ First��5m      $
��Left=�6$   $��70��6?   $��70��6K   $��	180 0 0 0q�6V   
�������.��5n      �� -   5        $ Second��5n      $��60��6)   $��60��65   $��Center=�6@   $��Center=�6[   
�������.��5o      �� -   5        $ Third��5o      $��45��6,   $��45��67   
������6[   5p      5q      5r      � 5s   
   $��2��6   $��2��6   $��0,19,0,0q�6,   .+�5t         Laba_6_7.UndoRedo  $��Center=�6   $��Center=�6:   $��48��6U   $	��240��6a   5u      5v      5w      