# Desarrollar una API para un app TODO

Crear un modelo Todo
- Debe tener un titulo con un maximo de 250 caracteres de tipo string y no puede ser nulo
- Debe tener una relacion has_many con TodoItem

Crear modelo TodoItem
- Debe tener una descripcion de tipo Text de 5000 caracteres, no puede ser nula
- Debe tener una propiedad hecho de tipo boolean la cual puede ser nula
- Debe tener una relacion belongs_to con Todo


La API debe poder crear Realizar las operaciones crud tipicas tanto para:
- Todo
- TodoApp