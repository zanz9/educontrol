import 'package:educontrol/core/service/injectable/di.dart';
import 'package:educontrol/core/service/models/student.dart';
import 'package:educontrol/core/service/storage/storage_service.dart';
import 'package:educontrol/features/admin_panel/bloc/admin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AdminBloc, AdminState>(
        bloc: getIt<AdminBloc>()..add(const AdminEvent.loadUsers()),
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (viewModel) {
              var students = viewModel.students;

              return Column(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Student student = Student(
                        lastName: 'LastName',
                        firstName: 'FirstName',
                        surName: 'SurName',
                        birthday: DateTime.now(),
                        phone: '1234567890',
                        email: 'email@example.com',
                        address: 'Address',
                        groupId: '1',
                      );
                      getIt<StorageService>().saveStudent(student);
                      getIt<AdminBloc>().add(const AdminEvent.loadUsers());
                    },
                    child: const Text('Add Student'),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Role')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: students.map((student) {
                        return DataRow(cells: [
                          DataCell(Text(student.id ?? '')),
                          DataCell(Text(
                              '${student.lastName} ${student.firstName} ${student.surName}')),
                          DataCell(Text(student.email)),
                          DataCell(Text(student.phone)),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {},
                              ),
                            ],
                          )),
                        ]);
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
