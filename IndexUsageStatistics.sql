��U S E   U n e m p l o y m e n t F u n d E n g i n e  
  
 S E L E C T       O B J E C T _ N A M E ( S . O B J E C T _ I D )   A S   [ O B J E C T   N A M E ] ,  
                   I . [ N A M E ]   A S   [ I N D E X   N A M E ] ,  
                   i . T y p e _ D e s c   A S   [ I n d e x   T y p e ] ,  
                   U S E R _ S E E K S ,  
                   U S E R _ S C A N S ,  
                   U S E R _ L O O K U P S ,  
                   U S E R _ U P D A T E S  
 F R O M           S Y S . D M _ D B _ I N D E X _ U S A G E _ S T A T S   A S   S  
 I N N E R   J O I N   S Y S . I N D E X E S   A S   I   O N   I . O B J E C T _ I D   =   S . O B J E C T _ I D  
                                                       A N D   I . I N D E X _ I D   =   S . I N D E X _ I D    
 W H E R E   i . n a m e   I S   N O T   N U L L  
 A N D   (        
 	 	 O B J E C T _ N A M E ( S . [ O B J E C T _ I D ] )   =   ' TableNameHere'  
 )  
 O R D E R   B Y   S . [ O B J E C T _ I D ] ,   u s e r _ S e e k s   D E S C   ,   u s e r _ s c a n s   D E S C 
