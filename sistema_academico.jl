# ================================
# SISTEMA DE ANÁLISIS ACADÉMICO
# Entrega #4 - Estructuras de Datos en Julia
# Jeremhy Dostyn Jesuá López Bautista - 251404
# ================================

# --- NamedTuples: datos de cada estudiante ---
estudiante1 = (nombre = "Ana García",    carnet = "241001", carrera = "Ingeniería en Sistemas")
estudiante2 = (nombre = "Carlos Pérez",  carnet = "241002", carrera = "Ciencias de la Computación")
estudiante3 = (nombre = "María López",   carnet = "241003", carrera = "Ingeniería en Sistemas")
estudiante4 = (nombre = "Diego Ramírez", carnet = "241004", carrera = "Matemática Aplicada")

# --- Set: cursos únicos disponibles ---
cursos_disponibles = Set([
    "Cálculo Diferencial",
    "Algoritmos",
    "Estadística",
    "Álgebra Lineal",
    "Programación Orientada a Objetos"
])

# --- Dict: estudiantes organizados por carnet ---
estudiantes = Dict(
    estudiante1.carnet => estudiante1,
    estudiante2.carnet => estudiante2,
    estudiante3.carnet => estudiante3,
    estudiante4.carnet => estudiante4
)

# Verificación
println("=== SISTEMA ACADÉMICO CARGADO ===")
println("\nEstudiantes registrados:")
for (carnet, est) in estudiantes
    println("  [$carnet] $(est.nombre) - $(est.carrera)")
end

println("\nCursos disponibles:")
for curso in cursos_disponibles
    println("  - $curso")
end

# Array: calificaciones por estudiante por curso
# Orden de cursos: Cálculo, Algoritmos, Estadística, Álgebra Lineal, POO
notas_ana     = [85.0, 90.0, 78.0, 92.0, 88.0]
notas_carlos  = [70.0, 95.0, 82.0, 75.0, 91.0]
notas_maria   = [92.0, 88.0, 95.0, 89.0, 84.0]
notas_diego   = [78.0, 72.0, 88.0, 95.0, 76.0]

# Matrix: tabla general de notas (filas=estudiantes, columnas=cursos)
matriz_notas = Matrix{Float64}([
    notas_ana';
    notas_carlos';
    notas_maria';
    notas_diego'
])

# Nombres de cursos en orden
cursos_ordenados = ["Cálculo", "Algoritmos", "Estadística", "Álgebra Lineal", "POO"]
nombres = ["Ana", "Carlos", "María", "Diego"]

println("\n=== TABLA DE CALIFICACIONES ===")
println(rpad("Estudiante", 12), join(rpad.(cursos_ordenados, 14)))
for i in 1:4
    println(rpad(nombres[i], 12), join(rpad.(matriz_notas[i,:], 14)))
end

# Promedio por estudiante
println("\n=== PROMEDIOS POR ESTUDIANTE ===")
for i in 1:4
    promedio = sum(matriz_notas[i,:]) / length(cursos_ordenados)
    println("  $(nombres[i]): $(round(promedio, digits=2))")
end

# Promedio por curso
println("\n=== PROMEDIO POR CURSO ===")
for j in 1:length(cursos_ordenados)
    promedio = sum(matriz_notas[:,j]) / 4
    println("  $(cursos_ordenados[j]): $(round(promedio, digits=2))")
end

# ANÁLISIS FINAL: todo interactuando junto ---

println("\n=== MEJOR Y PEOR ESTUDIANTE ===")
promedios = [sum(matriz_notas[i,:]) / length(cursos_ordenados) for i in 1:4]
mejor = nombres[argmax(promedios)]
peor = nombres[argmin(promedios)]
println("  Mejor promedio: $mejor ($(round(maximum(promedios), digits=2)))")
println("  Peor promedio:  $peor ($(round(minimum(promedios), digits=2)))")

println("\n=== ESTUDIANTES QUE APROBARON TODO (nota >= 75) ===")
for i in 1:4
    aprobó_todo = all(matriz_notas[i,:] .>= 75.0)
    if aprobó_todo
        println("  ✓ $(nombres[i])")
    else
        reprobados = cursos_ordenados[findall(matriz_notas[i,:] .< 75.0)]
        println("  ✗ $(nombres[i]) - reprobó: $(join(reprobados, ", "))")
    end
end

println("\n=== CURSO MÁS DIFÍCIL Y MÁS FÁCIL ===")
promedios_cursos = [sum(matriz_notas[:,j]) / 4 for j in 1:length(cursos_ordenados)]
mas_dificil = cursos_ordenados[argmin(promedios_cursos)]
mas_facil = cursos_ordenados[argmax(promedios_cursos)]
println("  Más difícil: $mas_dificil ($(round(minimum(promedios_cursos), digits=2)))")
println("  Más fácil:   $mas_facil ($(round(maximum(promedios_cursos), digits=2)))")

println("\n=== CARRERAS REPRESENTADAS ===")
carreras = Set([est.carrera for (_, est) in estudiantes])
println("  Total de carreras distintas: $(length(carreras))")
for carrera in carreras
    alumnos_carrera = [est.nombre for (_, est) in estudiantes if est.carrera == carrera]
    println("  $carrera: $(join(alumnos_carrera, ", "))")
end