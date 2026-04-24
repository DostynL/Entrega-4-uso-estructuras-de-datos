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