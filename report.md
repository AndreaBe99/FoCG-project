## Ray-Point Intersection vs Ray-Sphere Intersection

1. Ray-Point è meno costosa, infatti la ray-sphere intersection ha più operazioni di moltiplicazione e radici quadrate, tuttavia questo non è il motivo principale per il quale in yocto si usa la Ray-Point intersection.

2. Uno dei principali motivi per cui in Yocto viene usata la ray-point intersection riguarda la precisione numerica. Infatti la ray-point risulta numericamente più precisa, in quanto la ray-sphere intersection ha delle radice quadrate e se si fanno degli errori in floating point questi errori saranno più grandi.

3. La terza ragione è che il colore non è uguale in tutta la sfera perchè il vettore normale cambia, questo significa che se il punto è molto piccolo il mio raggio non può hittarla a random, quindi dobbiamo filtrare i colori  
