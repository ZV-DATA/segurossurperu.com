<x-web-layout>
    <div class="bg-cover bg-center w-full h-screen relative" style="background-image: url(/images/slider1.jpg)">
        <div>

        <div>
            <h1 class="text-5xl md:text-7xl font-extrabold absolute top-96 left-10 text-orange-400 ">Asistirte ante un accidente de transito es nuestra prioridad</h1>
        </div>
        <div class="absolute inset-x-0 bottom-0 h-16 bg-blue-700 flex items-center place-content-center">
            <div class="text-center">
                <p class="inline-block text-xs md:text-2xl text-center text-white font-bold">AFOCAT FUTUIRA, nos aseguramos que obtengas la mejor atención ante un accidente de tránsito.</p>
                <a href="#consultar" class="inline-block bg-orange-600 text-center text-white font-semibold py-1 px-1 md:py-2 md:px-3 rounded-sm">CONSULTAR</a>
            </div>
        </div>

        </div>
    </div>
    <div class="container mx-auto">
        <h2 class="py-20 text-5xl font-extrabold text-gray-900 text-center">¿Por qué elegir AFOCAT SUR PERU?</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="text-center shadow-md p-10">
                <i class="fa-solid fa-people-group h-12 text-orange-600"></i>
                <h6 class="text-3xl font-bold text-gray-900">13 años de experiencia</h6>
                <p>Somos una Asociación con 13 años de experiencia asistiendo a nuestros asociados.</p>
            </div>
            <div class="text-center shadow-md p-10">
                <i class="fa-solid fa-people-group h-12 text-orange-600"></i>
                <h6 class="text-3xl font-bold text-gray-900">Servicio garantizado</h6>
                <p>Cubrimos los riesgos por cada persona ocupante o no ocupante de un vehículo afiliado.</p>
            </div>
            <div class="text-center shadow-md p-10">
                <i class="fa-solid fa-people-group h-12 text-orange-600"></i>
                <h6 class="text-3xl font-bold text-gray-900">Confianza</h6>
                <p>Equipo de profesionales proactivos, expertos y dinamismo para asistirlo inmediatamente.</p>
            </div>
            <div class="text-center shadow-md p-10">
                <i class="fa-solid fa-people-group h-12 text-orange-600"></i>
                <h6 class="text-3xl font-bold text-gray-900">Asociaciones exclusivas</h6>
                <p>Convenios con Clínicas y hospitales para atenderte oportunamente.</p>
            </div>
            <div class="text-center shadow-md p-10">
                <i class="fa-solid fa-people-group h-12 text-orange-600"></i>
                <h6 class="text-3xl font-bold text-gray-900">Confiado por miles</h6>
                <p>A través de todos los años, hemos ganado muchos asociados leales que comparten nuestra visión.</p>
            </div>
            <div class="text-center shadow-md p-10">
                <i class="fa-solid fa-people-group h-12 text-orange-600"></i>
                <h6 class="text-3xl font-bold text-gray-900">Atención 24/7</h6>
                <p>Estamos las 24 horas de los 7 días de la semana, atentos a cualquier siniestros.</p>
            </div>
        </div>
    </div>
    <div id="consultar" class="bg-cover bg-center w-full h-96 relative" style="background-image: url(/images/image.jpg)">
        <div>
            <h1 class="text-white text-6xl font-bold mt-16 text-center pt-6">Consulta tu Afiliación</h1>
        </div>
        <div class="grid grid-cols-1 md:grid-colds-3 gap-4 mt-6 pb-16">
            <div>

            </div>
            <div>
                <div class="p-10">
                    <form action="{{ route('consult') }}" method="GET">
                        <div class="mb-6">
                            <input type="text" id="query" name="query" class="bg-gray-50 border border-gray-300 text-gray-900 text-1xl  rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="n° placa del vehículo" required>
                        </div>
                        <div>
                            <button type="submit" class="text-white bg-orange-600 font-medium rounded-lg text-1xl w-full px-5 py-2.5 text-cente">CONSULTAR</button>
                        </div>
                    </form>
                </div>
            </div>
            <div>

            </div>

        </div>
    </div>
</x-web-layout>
