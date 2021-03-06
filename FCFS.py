#   Institute of Technology of Cambodia ---------------------------------------------------------------
#   Name    : Ly Sengchhay              ---------------------------------------------------------------
#   Id      : e20180564                 ---------------------------------------------------------------
#   Group   : I3-GTR                    ---------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#   Code    : FCFS Scheduling non-Preemptive ----------------------------------------------------------
class FCFS:                                                                     #----------------------
    def processData(self, no_of_processes):                                     #----------------------
        process_data = []                                                       #----------------------
        for i in range(no_of_processes):                                        #----------------------
            temporary = []                                                      #----------------------
            p_id = int(input("Enter Process ID: "))                             #----------------------
            a_time = int(input("Enter Arrival Time: "))                         #----------------------
            b_time = int(input(f"Enter Burst Time for Process {p_id}: "))       #----------------------
            temporary.extend([p_id, a_time, b_time])                            #----------------------
            process_data.append(temporary)                                      #----------------------
        FCFS.schedulingProcess(self, process_data)                              #----------------------
    def schedulingProcess(self, process_data):                                  #----------------------
        process_data.sort(key=lambda x: x[1])                                   #----------------------
#   The First Arrival Process Execution and the next will be in queue ---------------------------------
#   Start Process Execution ---------------------------------------------------------------------------
        start_time = []                                                         #----------------------
        exit_time = []                                                          #----------------------
        s_time = 0                                                              #----------------------
        for i in range(len(process_data)):                                      #----------------------
            if s_time < process_data[i][1]:                                     #----------------------
                s_time = process_data[i][1]                                     #----------------------
            start_time.append(s_time)                                           #----------------------
            s_time = s_time + process_data[i][2]                                #----------------------
            e_time = s_time                                                     #----------------------
            exit_time.append(e_time)                                            #----------------------
            process_data[i].append(e_time)                                      #----------------------
        t_time = FCFS.calculateTurnaroundTime(self, process_data)               #----------------------
        w_time = FCFS.calculateWaitingTime(self, process_data)                  #----------------------
        FCFS.printData(self, process_data, t_time, w_time)                      #----------------------
    def calculateTurnaroundTime(self, process_data):                            #----------------------
        total_turnaround_time = 0                                               #----------------------
        for i in range(len(process_data)):                                      #----------------------
#   Calculate Turnaround time -------------------------------------------------------------------------
            turnaround_time = process_data[i][3] - process_data[i][1]           #---------------------- 
            total_turnaround_time = total_turnaround_time + turnaround_time     #----------------------
            process_data[i].append(turnaround_time)                             #----------------------
#   Calculate Average turnaround time -----------------------------------------------------------------
        average_turnaround_time = total_turnaround_time / len(process_data)     #----------------------
        return average_turnaround_time                                          #----------------------
    def calculateWaitingTime(self, process_data):                               #----------------------
        total_waiting_time = 0                                                  #----------------------
        for i in range(len(process_data)):                                      #----------------------
#   Calculate Waiting time ----------------------------------------------------------------------------
            waiting_time = process_data[i][4] - process_data[i][2]              #----------------------
            total_waiting_time = total_waiting_time + waiting_time              #----------------------
            process_data[i].append(waiting_time)                                #----------------------
#   Calculate Average waiting time --------------------------------------------------------------------
        average_waiting_time = total_waiting_time / len(process_data)           #----------------------
        return average_waiting_time                                             #----------------------
#   Display the Table of Process Execution ------------------------------------------------------------
    def printData(self, process_data, average_turnaround_time, average_waiting_time):
        print("Process_ID  Arrival_Time  Burst_Time  Completion_Time  Turnaround_Time  Waiting_Time")
        for i in range(len(process_data)):                                      #----------------------
            for j in range(len(process_data[i])):                               #----------------------
                print(process_data[i][j], end="				")                  #----------------------
            print()                                                             #----------------------
#   Display Average turnaround time -------------------------------------------------------------------
        print(f'Average Turnaround Time: {average_turnaround_time}')            #----------------------
#   Display Average waiting time ----------------------------------------------------------------------
        print(f'Average Waiting Time: {average_waiting_time}')                  #----------------------
if __name__ == "__main__":                                                      #----------------------
    no_of_processes = int(input("Enter number of processes: "))                 #----------------------
    fcfs = FCFS()                                                               #----------------------
    fcfs.processData(no_of_processes)                                           #----------------------
#   End of Code ---------------------------------------------------------------------------------------
