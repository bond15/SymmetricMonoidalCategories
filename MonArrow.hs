module MonArrow where
import Control.Category
import Prelude hiding(id)
import Data.Category.Monoidal

{-
class Category a => Arrow a where
    {-# MINIMAL arr, (first | (***)) #-}

    -- | Lift a function to an arrow.
    arr :: (b -> c) -> a b c

    -- | Send the first component of the input through the argument
    --   arrow, and copy the rest unchanged to the output.
    first :: a b c -> a (b,d) (c,d)
    first = (*** id)

    -- | A mirror image of 'first'.
    --
    --   The default definition may be overridden with a more efficient
    --   version if desired.
    second :: a b c -> a (d,b) (d,c)
    second = (id ***)

    -- | Split the input between the two argument arrows and combine
    --   their output.  Note that this is in general not a functor.
    --
    --   The default definition may be overridden with a more efficient
    --   version if desired.
    (***) :: a b c -> a b' c' -> a (b,b') (c,c')
    f *** g = first f >>> arr swap >>> first g >>> arr swap
      where swap ~(x,y) = (y,x)

    -- | Fanout: send the input to both argument arrows and combine
    --   their output.
    --
    --   The default definition may be overridden with a more efficient
    --   version if desired.
    (&&&) :: a b c -> a b c' -> a b (c,c')
    f &&& g = arr (\b -> (b,b)) >>> f *** g    

-}

-- the goal
class SymmetricTensorProduct f => MonArrow f where
    {-
    {-# MINIMAL arr, (first | (***)) #-}
    
    

    -- | Lift a function to an arrow.
    arr :: (b -> c) -> a b c

    -- | Send the first component of the input through the argument
    --   arrow, and copy the rest unchanged to the output.
    first :: a b c -> a (b,d) (c,d)
    first = (*** id)

    -- | A mirror image of 'first'.
    --
    --   The default definition may be overridden with a more efficient
    --   version if desired.
    second :: a b c -> a (d,b) (d,c)
    second = (id ***)

    -- | Split the input between the two argument arrows and combine
    --   their output.  Note that this is in general not a functor.
    --
    --   The default definition may be overridden with a more efficient
    --   version if desired.
    (***) :: a b c -> a b' c' -> a (b,b') (c,c')
    f *** g = first f >>> arr swap >>> first g >>> arr swap
      where swap ~(x,y) = (y,x)

    -- | Fanout: send the input to both argument arrows and combine
    --   their output.
    --
    --   The default definition may be overridden with a more efficient
    --   version if desired.
    (&&&) :: a b c -> a b c' -> a b (c,c')
    f &&& g = arr (\b -> (b,b)) >>> f *** g 
    -}