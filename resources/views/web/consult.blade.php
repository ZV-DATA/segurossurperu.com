<x-web-layout>
    @if ($customer)

    <div class="container mx-auto relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-900 mt-4">
            <thead class="text-xs text-white uppercase bg-blue-600">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        Departamento
                    </th>
                    <th>
                        Contrato
                    </th>
                    <th>
                        Vigencia policial
                    </th>
                    <th>
                        Certificado
                    </th>
                    <th>
                        Uso
                    </th>
                    <th>
                        Placa
                    </th>
                    <th>
                        Categoría
                    </th>
                    <th>
                        Clase de vehiculo
                    </th>
                    <th>
                        Estado
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="bg-white border-b dark:bg-gray-50 dark:border-gray-700">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900  whitespace-nowrap">
                        {{ $customer->name }}
                    </th>
                    <td>
                        {{ $customer->contact_start_date }} <br>
                        {{ $customer->contact_end_date }}
                    </td>
                    <td>
                        {{ $customer->contact_start_date }} <br>
                        {{ $customer->contact_end_date }}
                    </td>
                    <td>
                        {{ $customer->certificate_number }}

                    </td>
                    <td>
                        {{ $customer->service_type }}
                    </td>
                    <td>
                        {{ $customer->license_plate }}
                    </td>
                    <td>
                        {{ $customer->category }}
                    </td>
                    <td>
                        {{ $customer->vehicle_class }}
                    </td>
                    <td>
                        {{ $customer->status }}
                    </td>
                </tr>

            </tbody>
        </table>


    </div>

    @else

    <div>
        <h2>
            No hay datos para mostrar
        </h2>
    </div>

    @endif

</x-web-layout>
